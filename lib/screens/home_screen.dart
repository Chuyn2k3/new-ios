import 'package:appdemo/departments/department_screen.dart';
import 'package:appdemo/models/detail_screen.dart';
import 'package:appdemo/screens/info_screen.dart';
import 'package:appdemo/screens/login_screen.dart';
import 'package:appdemo/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/screens/device_screen.dart';
import 'package:appdemo/screens/error_screen.dart';
import 'package:appdemo/employees/employee_screen.dart';
import 'package:appdemo/screens/statistic_screen.dart';
import 'package:appdemo/screens/myInventory_screen.dart';

class Fuction {
  const Fuction({this.title, this.icon});
  final String? title;
  final IconData? icon;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Fuction> fuc = const <Fuction>[
    const Fuction(title: "Thiết Bị", icon: Icons.local_hospital),
    const Fuction(title: "Báo Hỏng", icon: Icons.notifications_active),
    const Fuction(title: "Khoa Phòng", icon: Icons.business),
    const Fuction(title: "Nhân Viên", icon: Icons.person),
    const Fuction(title: "Thống Kê", icon: Icons.bar_chart),
    const Fuction(title: "Kiểm kê", icon: Icons.inventory),
  ];
  int _currentIndex = 0;
  List page = [HomeScreen(), InfoScreen()];
  DateTime pre_backpress=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final timegap=DateTime.now().difference(pre_backpress);
        print('$timegap');
        pre_backpress=DateTime.now();
        final canExit=timegap>=Duration(seconds: 2);
        if(canExit){
               final snack=SnackBar(content: Text('Ấn 2 lần để thoát'),duration: Duration(seconds: 2),);
               ScaffoldMessenger.of(context).showSnackBar(snack);
               return false;
               //final snack=SnackBar(content: Text('Ấn 2 lần để thoát'),duration: Duration(seconds: 2),);
        }else{
             return true;
        }
        //return false;
      },
    child: Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(children: [
        Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: CircleAvatar(
                          child: Image.asset('assets/images/logo-bo-y-te.jpg'),
                          radius: 14,
                        ),
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Xin chào',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              Icon(
                                Icons.back_hand,
                                size: 20,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                          Text(
                            'Pham Viet Chuyen',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, NotificationScreen.routeName);
                      },
                      child: Icon(
                        Icons.notifications,
                        color: Colors.yellow,
                        size: 45,
                      ))
                ],
              ),
            ),
          )
        ]),
        SizedBox(height: 50),
        Positioned.fill(
            top: 100,
            //bottom: 55,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: GridView(
                padding:
                    EdgeInsets.only(top: 20, right: 60, left: 60, bottom: 30),
                children: [
                  InkWell(
                    highlightColor: Colors.grey, //hiệu ứng khi giữ lâu
                    splashColor: Colors.red, //hiệu ứng khi chạm vào
                    onTap: () {
                      Navigator.pushNamed(context, DeviceScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_services,
                            size: 60,
                            color: const Color.fromARGB(255, 238, 52, 39),
                          ),
                          Text(
                            "Thiết Bị",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ErrorScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notification_important,
                            size: 60,
                            color: Colors.orange,
                          ),
                          Text(
                            "Báo Hỏng",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DepartmentScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.business,
                            size: 60,
                            color: Color.fromRGBO(110, 139, 61, 1),
                          ),
                          Text(
                            "Khoa Phòng",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EmployeeScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 60,
                            color: Color.fromARGB(255, 33, 180, 38),
                          ),
                          Text(
                            "Nhân Viên",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, StatisticScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.analytics,
                            size: 60,
                            color: Color.fromARGB(255, 210, 104, 139),
                          ),
                          Text(
                            "Thống Kê",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, myInventoryScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 235, 235, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory,
                            size: 60,
                            color: Color(0xFF045EA9),
                          ),
                          Text(
                            "Kiểm kê",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50),
              ),
            )),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(30),
        //               topRight: Radius.circular(20))),
        //       child: BottomNavigationBar(
        //           selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        //           currentIndex: _currentIndex,
        //           onTap: (index) {
        //             setState(() {
        //               _currentIndex = index;
        //             });
        //           },
        //           iconSize: 30,
        //           items: [
        //             BottomNavigationBarItem(
        //               icon: Icon(Icons.home),
        //               label: 'Trang chủ',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: Icon(Icons.crop_free),
        //               label: 'Scan',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: Icon(Icons.person_2),
        //               label: 'Cá nhân',
        //             ),
        //           ],
        //         ),
        //       ),
        // ),
      ]),
    ));
  }
}
