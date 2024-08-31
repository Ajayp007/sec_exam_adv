import 'package:flutter/material.dart';

class HomeModel {
  String? name, mobile, image, chat;
  DateTime? date;
  TimeOfDay? time;

  HomeModel(
      {this.name, this.image, this.mobile, this.chat, this.date, this.time});
}
