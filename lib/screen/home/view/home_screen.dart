import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sec_exam_adv/screen/dash/view/add_contact.dart';
import 'package:sec_exam_adv/screen/dash/view/call_contact.dart';
import 'package:sec_exam_adv/screen/dash/view/msg_contact.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readContact();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: controller.index,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title: const Text(
            "Contact App",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('backup');
              },
              icon: const Icon(Icons.backup_outlined),
            ),
          ],
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
