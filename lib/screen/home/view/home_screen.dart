import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sec_exam_adv/screen/dash/view/add_contact.dart';
import 'package:sec_exam_adv/screen/dash/view/call_contact.dart';
import 'package:sec_exam_adv/screen/dash/view/msg_contact.dart';
import 'package:sec_exam_adv/screen/home/model/home_model.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: controller.index!,
      child: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/b/b7/Google_Contacts_logo.png",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Ajay Purohit"),
                  subtitle: Text("+91 8140986630"),
                ),
                const Divider(
                  color: Colors.black54,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('backup');
                  },
                  title: const Text("BackUp Contacts"),
                  trailing: const Icon(Icons.backup_outlined),
                ),
                const Divider(
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title: const Text(
            "Contact App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.person_add_alt_1_outlined),
              ),
              Tab(
                text: "Call",
              ),
              Tab(
                text: "Msg",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [AddContact(), CallContact(), MsgContact()],
        ),
      ),
    );
  }
}
