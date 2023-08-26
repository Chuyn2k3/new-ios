// ignore_for_file: unused_import

import 'package:appdemo/routes.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
        ),
         routes: routes,
        home:Scaffold(
          body:SplashScreen()
        ),
        );
  }
}
