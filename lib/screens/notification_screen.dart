import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static String routeName = "notificaton_screen";
  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Thông Báo',
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
      ),
    );
  }
}
