import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/controller/home_controller.dart';

class MsgContact extends StatefulWidget {
  const MsgContact({super.key});

  @override
  State<MsgContact> createState() => _MsgContactState();
}

class _MsgContactState extends State<MsgContact> {
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
              onTap: () {},
              leading: controller.contactList[index]['image'] == null
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
                " ${controller.contactList[index]['msg']}",
              ),
              trailing: IconButton(
                onPressed: () async {
                  String call =
                      "sms:+91${controller.contactList[index]['mobile']}";
                  await launchUrl(Uri.parse(call));
                },
                icon: const Icon(Icons.chat),
              ),
            );
          },
        ),
      ),
    );
  }
}
