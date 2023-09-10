import 'package:flutter/material.dart';
import 'package:appdemo/models/model.dart';
import 'package:appdemo/models/detail_screen.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});
  static String routeName = "error_screen";
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Báo Hỏng'),
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
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                            borderSide: BorderSide(width: 0.8),                           
                            ),
                            hintText: 'Tên/mã thiết bị còn hoạt động',
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
              GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 225, 222, 222)),
                        margin: const EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        alignment: Alignment.center,
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quét mã QR',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 5,

                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 27.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ))),                 
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Bấm vào để xem chi tiết',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ))
                ],
              ),
              Flexible(
                  child: ListView.builder(                     
                      scrollDirection: Axis.vertical,
                      itemCount: modelList.length,
                      itemBuilder: (context, index) {
                        Model model = modelList[index];
                        return GestureDetector(
                            onTap: () {                             
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(model)));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.only(right: 30, left: 30),
                              height: 80,
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
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        model.titile,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Model: ${model.model}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Serial: ${model.serial}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text('Trạng thái: ${model.description}',
                                          style: const TextStyle(
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
