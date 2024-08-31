import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sec_exam_adv/screen/home/model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> contactList = <HomeModel>[].obs;
  Rx<DateTime> changeDate = DateTime.now().obs;
  Rx<TimeOfDay> changeTime = TimeOfDay.now().obs;
  int index=0;

  void changeIndex(int index)
  {
    index = index;
  }

  void addContact(HomeModel m1) {
    contactList.add(m1);
  }

  void selectedData(DateTime date) {
    changeDate.value = date;
  }

  void selectedTime(TimeOfDay time) {
    changeTime.value = time;
  }
}
