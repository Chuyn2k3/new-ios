import 'package:flutter/material.dart';


class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});
  static String routeName = "statistic_screen";
  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Thống Kê'),
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
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, left: 5),
                        child: Column(
                          children: [
                            const Text(
                              'Chọn loại dữ liệu',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                   showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                                    ),
                                    builder: (context) => Container(
                                      child: Container(
                                        height: 120,                                     
                                        padding: const EdgeInsets.all(20),
                                        child: const Column(
                                          children: [
                                            Text('Khoa phòng',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                    )
                                      );
                                },
                                child: Container(
                                  height: 30,
                                  margin: const EdgeInsets.all(10),
                                  width: 420,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 232, 230, 230),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                  alignment: Alignment.center,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(

                                          child: Text(
                                        'Khoa phòng',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(                                     
                                        Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, left: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Trạng thái',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  height: 30,
                                  margin: const EdgeInsets.all(10),
                                  width: 420,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 232, 230, 230),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                  alignment: Alignment.center,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        'Tất cả',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
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
            ])));
  }
}
