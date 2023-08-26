import 'dart:math';
import 'package:flutter/material.dart';
import 'package:appdemo/models/model.dart';
import 'package:appdemo/models/detail_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});
  static String routeName = "device_screen";
  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: Text('Thiết Bị'),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
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
                      margin: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: TextFormField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 137, 37, 37)),
                        maxLength: 500,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 227, 224, 224),
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            //border: OutlineInputBorder(
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                            //borderSide: BorderSide(width: 0.8),
                            //),
                            //border: InputBorder.none,
                            hintText: 'Tên thiết bị,mã thiết bị,...',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            //  focusedBorder: UnderlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.blue), // Viền khi focus
                            //  )
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 194, 190, 190),
                        ),
                        margin: EdgeInsets.only(top: 0, right: 20, bottom: 5),
                        child: TextButton(
                          child: Text(
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
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 5, left: 10),
                        child: Column(
                          children: [
                            Text(
                              'Trạng thái',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                   showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                                    ),
                                    builder: (context) => Container(
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Text('Lọc Trạng Thái',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                    )
                                      );
                                },
                                child: Container(
                                  height: 30,
                                  margin: EdgeInsets.all(10),
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 232, 230, 230),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        'Tất cả',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 5, left: 10),
                        child: Column(
                          children: [
                            Text(
                              'Khoa phòng',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  height: 30,
                                  margin: EdgeInsets.all(10),
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 232, 230, 230),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        'Tất cả',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Bấm vào để xem chi tiết',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ))
                ],
              ),
              Flexible(
                  child: ListView.builder(
                      //shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: modelList.length,
                      itemBuilder: (context, index) {
                        Model _model = modelList[index];
                        return GestureDetector(
                            onTap: () {
                              print('ok');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(_model)));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.only(right: 30, left: 30),
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 239, 239),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                //mainAxisAlignment:MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/logo-bo-y-te.jpg'),
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _model.titile,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Model: ' + _model.model,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Serial: ' + _model.serial,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text('Trạng thái: ' + _model.description,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      }))
            ])));
  }
}
