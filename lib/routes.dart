//import 'dart:js';

import 'package:appdemo/models/detail_screen.dart';
import 'package:appdemo/screens/device_screen.dart';
import 'package:appdemo/screens/home_screen.dart';
import 'package:appdemo/screens/intro_screen.dart';
import 'package:appdemo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import "package:appdemo/screens/splash_screen.dart";
import 'package:appdemo/models/report_screen.dart';
import 'package:appdemo/models/inventory_screen.dart';
//import 'package:appdemo/models/model.dart';
//import 'package:appdemo/models/detail_screen.dart';
import 'package:appdemo/screens/intro_screen.dart';
final Map<String, WidgetBuilder> routes={
  SplashScreen.routeName: (context) =>const SplashScreen(),
  IntroScreen.routeName: (context) =>const IntroScreen(),
  LoginScreen.routeName: (context) =>const LoginScreen(),
  HomeScreen.routeName: (context) =>const HomeScreen(),
  DeviceScreen.routeName:(context) =>const DeviceScreen(),
  //DetailsScreen.routeName: (context) => DetailsScreen(models: Model(titile: titile, description: description, yearUse: yearUse, yearMan: yearMan, model: model, serial: serial, manufacturer: manufacturer, origin: origin),),
  //ReportScreen.routeName: (context) => ReportScreen(Model),
};
