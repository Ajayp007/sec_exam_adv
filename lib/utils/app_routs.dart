import 'package:flutter/material.dart';
import 'package:sec_exam_adv/screen/backup/view/backup_contact.dart';
import 'package:sec_exam_adv/screen/home/view/home_screen.dart';
import 'package:sec_exam_adv/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routs = {
  '/' : (context) => const SplashScreen(),
  'home' : (context) => const HomeScreen(),
  'backup' : (context) => const BackupContact(),
};