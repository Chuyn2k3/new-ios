import 'package:flutter/material.dart';
import 'package:appdemo/screens/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String routeName = 'intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  TextEditingController _textEditingController =
      TextEditingController(text: "https://bvsonla.qltbyt.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/logo-bo-y-te.jpg',
            width: 120,
            height: 120,
          ),
          height: 200,
          //color: Colors.black,
        ),
        SizedBox(
          height: 70,
        ),
        Text(
          " Quản Lý Thiết Bị Y Tế",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
        ),
        Container(
            height: 45,
            margin: EdgeInsets.all(35),
            decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                color: Color.fromRGBO(220, 220, 220, 0.5),
                borderRadius: BorderRadius.circular(15.0)),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(Icons.public),
              ),
            )),
            Padding(padding: EdgeInsets.symmetric(horizontal: 40),
        child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: Text('Bắt Đầu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ))
      ],
    )));
  }
}
