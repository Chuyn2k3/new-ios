import 'package:appdemo/services/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/screens/Myhome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final api = DemoAPI();
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool radioValue = false;
  bool passToggle = true;
  // void signUserIn() async {
  //   // show loading circle
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );

  //   // try sign in
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passController.text,
  //     );
  //     await DemoAPI().diologin();
  //     // pop the loading circle
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     // pop the loading circle
  //     Navigator.pop(context);
  //     // WRONG EMAIL
  //     if (e.code == 'user-not-found') {
  //       // show error to user
  //       wrongEmailMessage();
  //     }

  //     // WRONG PASSWORD
  //     else if (e.code == 'wrong-password') {
  //       // show error to user
  //       wrongPasswordMessage();
  //     }
  //   }
  // }

  // // wrong email message popup
  // void wrongEmailMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Email',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // // wrong password message popup
  // void wrongPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Password',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          bool emailVaild = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (value.isEmpty) {
                            return "Nhập email";
                          } else if (!emailVaild) {
                            return "Nhập email hợp lệ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
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
                          } else if (passController.text.length < 6) {
                            return "Mật khẩu phải dài hơn 6 ký tự";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
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
                                const Text(
                                  'Ghi nhớ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formfield.currentState!.validate()) {
                            emailController.clear();
                            passController.clear();
                            try {
                              await DemoAPI().diologin();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  MyhomeScreen.routeName, (route) => false);
                            } catch (e) {
                              print('error');
                            }
                          }
                        },
                        child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: const Center(
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
