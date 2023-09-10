import 'package:flutter/material.dart';
import "package:appdemo/employees/employee.dart";

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});
  static String routeName = "employee_screen";
  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Nhân Viên'),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 137, 37, 37)),
                        maxLength: 500,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 227, 224, 224),
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            hintText: 'Tên nhân viên,email,SĐT,...',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              borderSide: BorderSide(
                                width: 4,
                                color: Colors.blue,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 49,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 194, 190, 190),
                        ),
                        margin: const EdgeInsets.only(top: 3, right: 20, bottom: 5),
                        child: TextButton(
                          child: const Text(
                            'Tìm kiếm',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          onPressed: () {},
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Bấm vào thông tin nhân viên để liên lạc',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              Flexible(
                  child: ListView.builder(
                      //shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: employeeList.length,
                      itemBuilder: (context, index) {
                        Employee employee = employeeList[index];
                        return GestureDetector(
                            onTap: () {                             
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.only(right: 30, left: 30),
                              height: 100,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 241, 239, 239),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(                              
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/logo-bo-y-te.jpg'),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        employee.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const Icon(Icons.email_outlined,size: 17),
                                          const SizedBox(width: 5,),
                                          GestureDetector(
                                            onTap:() {
                                              
                                            },
                                           child: Text(
                                               employee.email,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height:10),
                                      Row(
                                        children: [
                                          const Icon(Icons.phone_android_outlined,size: 17,),
                                          const SizedBox(width: 5,),
                                          GestureDetector(
                                          onTap:() {
                                            
                                          },
                                          child:Text(
                                            employee.phone,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),)
                                        ],
                                      ),                                     
                                    ],
                                  )
                                ],
                              ),
                            ));
                      }))
            ])));
  }
}
