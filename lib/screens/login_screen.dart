import 'package:flutter/material.dart';
import 'package:appdemo/screens/Myhome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool radioValue = false;
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: SafeArea(
                    child: Form(
                  key: _formfield,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo-bo-y-te.jpg',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          bool emailVaild = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (value!.isEmpty) {
                            return "Nhập email";
                          } else if (!emailVaild) {
                            return "Nhập email hợp lệ";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nhập mật khẩu";
                          }
                          else if (passController.text.length < 6) {
                            return "Mật khẩu phải dài hơn 6 ký tự";
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quên mật khẩu',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w200),
                            ),
                            Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.red),
                                  value: radioValue,
                                  groupValue: true,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      radioValue = !radioValue;
                                    });
                                  },
                                  toggleable: true, //giup bat tat button
                                ),
                                Text(
                                  'Ghi nhớ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formfield.currentState!.validate()) {
                            emailController.clear();
                            passController.clear();
                            Navigator.pushNamedAndRemoveUntil(context, MyhomeScreen.routeName,(route)=>false);
                          }
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: Center(
                                child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                      )
                    ],
                  ),
                )))));
  }
}
