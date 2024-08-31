import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec_exam_adv/screen/home/controller/home_controller.dart';
import 'package:sec_exam_adv/screen/home/model/home_model.dart';
import 'package:sec_exam_adv/utils/helper/db_helper.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtMsg = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? path;
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      path == null
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              maxRadius: 60,
                              child: InkWell(
                                onTap: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(
                                    () {
                                      path = image!.path;
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.image_search,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(File(path!)),
                              maxRadius: 60,
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtMobile,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Mobile"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Mobile Number";
                    } else if (value.length != 10) {
                      return "Please Enter 10 Digits";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtMsg,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Msg"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Msg";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          DateTime? d1 = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2050));

                          controller.selectedData(d1!);
                        },
                        label: Text(
                            "${controller.changeDate.value.day}/${controller.changeDate.value.month}/${controller.changeDate.value.year}"),
                        icon: const Icon(Icons.calendar_month),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          TimeOfDay? t1 = await showTimePicker(
                              context: context,
                              initialTime: controller.changeTime.value);
                          controller.selectedTime(t1!);
                        },
                        label: Text(
                            "${controller.changeTime.value.hour}:${controller.changeTime.value.minute}"),
                        icon: const Icon(Icons.watch_later_outlined),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: MediaQuery.sizeOf(context).width,
                  color: Colors.blue,
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (path != null) {
                        HomeModel m1 = HomeModel(
                          name: txtName.text,
                          image: path,
                          chat: txtMsg.text,
                          mobile: txtMobile.text,
                          date: controller.changeDate.value,
                          time: controller.changeTime.value,
                        );
                        controller.addContact(m1);
                        DbHelper.helper.insertContactDB(
                            txtName.text, txtMobile.text, txtMsg.text, path!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Saved successfully"),
                          ),
                        );
                        formKey.currentState!.reset();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Enter The Details"),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
