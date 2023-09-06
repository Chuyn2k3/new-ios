import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:appdemo/models/model.dart';
//import 'package:appdemo/models/detail_screen.dart';
import 'package:appdemo/departments/department.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});
  static String routeName = "department_screen";
  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: Text('Khoa phòng'),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(children: [
              Flexible(
                  child: ListView.builder(
                      //shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: departmentList.length,
                      itemBuilder: (context, index) {
                        Department _department = departmentList[index];
                        return Container(
                            child: Container(
                          margin: EdgeInsets.all(20),
                          //padding: EdgeInsets.only(right: 30, left: 30),
                          height: 235,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 239, 239),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  _department.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 5, left: 15, right: 5),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Icon(
                                                Icons.email_outlined,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                _department.email,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            right: 5,
                                            child: Icon(
                                                Icons.keyboard_arrow_right))
                                      ],
                                    ),
                                  )),
                              Divider(
                                //Divider tạo dòng kẻ ngang
                                color: Colors.blue[700], // Màu của dòng kẻ
                                thickness: 1.4, // Độ dày của dòng kẻ
                                indent: 10, // Khoảng cách từ lề trái
                                endIndent: 10, // Khoảng cách từ lề phải
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              Icons.phone_android_outlined,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _department.sdt,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          right: 5,
                                          child:
                                              Icon(Icons.keyboard_arrow_right))
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                //Divider tạo dòng kẻ ngang
                                color: Colors.blue[700], // Màu của dòng kẻ
                                thickness: 1.4, // Độ dày của dòng kẻ
                                indent: 10, // Khoảng cách từ lề trái
                                endIndent: 10, // Khoảng cách từ lề phải
                              ),
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              Icons.location_on_outlined,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              _department.address,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          right: 5,
                                          child:
                                              Icon(Icons.keyboard_arrow_right))
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                //Divider tạo dòng kẻ ngang
                                color: Colors.blue[700], // Màu của dòng kẻ
                                thickness: 1.4, // Độ dày của dòng kẻ
                                indent: 10, // Khoảng cách từ lề trái
                                endIndent: 10, // Khoảng cách từ lề phải
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              Icons.menu_open,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Danh sách thiết bị",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          right: 5,
                                          child:
                                              Icon(Icons.keyboard_arrow_right))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
                      }))
            ])));
  }
}
