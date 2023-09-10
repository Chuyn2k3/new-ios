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
          title: const Text('Khoa phòng'),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
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
                        Department department = departmentList[index];
                        return Container(
                            child: Container(
                          margin: const EdgeInsets.all(20),
                          //padding: EdgeInsets.only(right: 30, left: 30),
                          height: 235,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 239, 239),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  department.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 5, left: 15, right: 5),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              const Icon(
                                                Icons.email_outlined,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                department.email,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Positioned(
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
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            const Icon(
                                              Icons.phone_android_outlined,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              department.sdt,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Positioned(
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
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            const Icon(
                                              Icons.location_on_outlined,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              department.address,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Positioned(
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
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 15, right: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: const Row(
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
                                      const Positioned(
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
