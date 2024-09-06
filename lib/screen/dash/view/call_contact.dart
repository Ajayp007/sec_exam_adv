import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sec_exam_adv/screen/home/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CallContact extends StatefulWidget {
  const CallContact({super.key});

  @override
  State<CallContact> createState() => _CallContactState();
}

class _CallContactState extends State<CallContact> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.contactList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
              },
              leading: controller.contactList.value[index]['image'] == null
                  ? const CircleAvatar()
                  : CircleAvatar(
                      backgroundImage: FileImage(
                        File("${controller.contactList[index]['image']}"),
                      ),
                    ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: Text(
                "${controller.contactList[index]['name']}",
              ),
              subtitle: Text(
                " ${controller.contactList[index]['mobile']}",
              ),
              trailing: IconButton(
                onPressed: () async {
                  String call =
                      "tel:+91${controller.contactList[index]['mobile']}";
                  await launchUrl(Uri.parse(call));
                },
                icon: const Icon(Icons.phone),
              ),
            );
          },
        ),
      ),
    );
  }
}
