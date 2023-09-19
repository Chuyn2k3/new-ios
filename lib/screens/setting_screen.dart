import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static String routeName = 'setting_screen';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  bool isSwitchedKey = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  void toggleSwitchKey(bool value) {
    if (isSwitchedKey == false) {
      setState(() {
        isSwitchedKey = true;
      });
    } else {
      setState(() {
        isSwitchedKey = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Cài Đặt'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 231, 231)),
                child: Column(children: [
                  Container(
                      height: 70,
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.settings),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Lưu mật khẩu',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Positioned(
                              right: 3,
                              child: Switch(
                                value: isSwitchedKey,
                                onChanged: toggleSwitchKey,
                                activeColor: Colors.blue,
                                activeTrackColor:
                                    const Color.fromARGB(255, 171, 206, 235),
                                inactiveThumbColor:
                                    const Color.fromARGB(255, 234, 231, 231),
                                inactiveTrackColor: Colors.grey,
                              )),
                        ],
                      )),
                  Divider(
                    //Divider tạo dòng kẻ ngang
                    color: Colors.blue[700], // Màu của dòng kẻ
                    thickness: 1.4, // Độ dày của dòng kẻ
                    indent: 20, // Khoảng cách từ lề trái
                    endIndent: 20, // Khoảng cách từ lề phải
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.logout),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Xác thực bằng vân tay',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Positioned(
                            bottom: -9,
                            right: 3,
                            child: Switch(
                              value: isSwitched,
                              onChanged: toggleSwitch,
                              activeColor: Colors.blue,
                              activeTrackColor:
                                  const Color.fromARGB(255, 171, 206, 235),
                              inactiveThumbColor:
                                  const Color.fromARGB(255, 234, 231, 231),
                              inactiveTrackColor: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
