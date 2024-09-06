import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sec_exam_adv/utils/helper/db_helper.dart';

class HomeController extends GetxController {
  RxList<Map> contactList = <Map>[].obs;
  Rx<DateTime> changeDate = DateTime.now().obs;
  Rx<TimeOfDay> changeTime = TimeOfDay.now().obs;
  int index = 0;

  void changeIndex(int index) {
    index = index;
  }

  void selectedData(DateTime date) {
    changeDate.value = date;
  }

  void selectedTime(TimeOfDay time) {
    changeTime.value = time;
  }

  Future<void> readContact() async {
    contactList.value = await DbHelper.helper.readContactDB();
  }

  void insertContact(String name, String mobile, String msg) {
    DbHelper.helper.insertContactDB(
        name,
        mobile,
        msg,
        "${changeDate.value.day}/${changeDate.value.month}/${changeDate.value.year}",
        "${changeTime.value.hour}:${changeTime.value.minute}");
    readContact();
  }

  void updateContact(String name, String mobile, String msg, int id) {
    DbHelper.helper.updateContactDB(
        name,
        id,
        mobile,
        msg,
        "${changeDate.value.day}/${changeDate.value.month}/${changeDate.value.year}",
        "${changeTime.value.hour}:${changeTime.value.minute}");
    readContact();
  }

  void deleteContact(int id) {
    DbHelper.helper.deleteContactDB(id);
    readContact();
  }
}
