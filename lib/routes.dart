//import 'dart:js';

import 'package:appdemo/departments/department_screen.dart';
import 'package:appdemo/employees/employee_screen.dart';
import 'package:appdemo/screens/device_screen.dart';
import 'package:appdemo/screens/home_screen.dart';
import 'package:appdemo/screens/info_screen.dart';
import 'package:appdemo/screens/intro_screen.dart';
import 'package:appdemo/screens/login_screen.dart';
import 'package:appdemo/screens/myhome_screen.dart';
import 'package:appdemo/screens/notification_screen.dart';
import 'package:appdemo/screens/qr_screen.dart';
import 'package:appdemo/screens/setting_screen.dart';
import 'package:appdemo/screens/statistic_screen.dart';
import 'package:flutter/material.dart';
import "package:appdemo/screens/splash_screen.dart";
//import 'package:appdemo/models/model.dart';
//import 'package:appdemo/models/detail_screen.dart';
import 'package:appdemo/screens/error_screen.dart';
import 'package:appdemo/screens/myInventory_screen.dart';
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DeviceScreen.routeName: (context) => const DeviceScreen(),
  //DetailsScreen.routeName: (context) => DetailsScreen(models: Model(titile: titile, description: description, yearUse: yearUse, yearMan: yearMan, model: model, serial: serial, manufacturer: manufacturer, origin: origin),),
  //ReportScreen.routeName: (context) => ReportScreen(Model),
  ErrorScreen.routeName: (context) => const ErrorScreen(),
  InfoScreen.routeName :(context) => const InfoScreen(),
  MyhomeScreen.routeName:(context) => const MyhomeScreen(),
  SettingScreen.routeName:(context) => const SettingScreen(),
  DepartmentScreen.routeName:(context) => const DepartmentScreen(),
  NotificationScreen.routeName:(context) => const NotificationScreen(),
  EmployeeScreen.routeName:(context) => const EmployeeScreen(),
  StatisticScreen.routeName:(context) => const StatisticScreen(),
  myInventoryScreen.routeName:(context) => const myInventoryScreen(),
  QRScreen.routeName:(context) => const QRScreen(),
};
