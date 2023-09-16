import 'package:appdemo/departments/get_department_list.dart';
import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/department_model.dart';
import 'package:flutter/material.dart';
//import 'package:appdemo/models/model.dart';
//import 'package:appdemo/models/detail_screen.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});
  static String routeName = "department_screen";
  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  TextEditingController _textEditingController = TextEditingController();
  Future<List<DepartmentData>?> DataList() async {
    final List<DepartmentData>? dataList = await getDataDepartmentFromApi();

    // Lọc danh sách dựa trên điều kiện
    return dataList;
  }

  List<DepartmentData> _department = [];
  void fetchDepartmentData() async {
    _department = (await DataList())!;
  }

  bool isLoading = false;
  void initState() {
    super.initState();
    fetchDepartmentData();
  }

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
                        onChanged: searchDepartment,
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
                            hintText: 'Tên khoa phòng',
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
                        height: 49.55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 194, 190, 190),
                        ),
                        margin:
                            const EdgeInsets.only(top: 3, right: 20, bottom: 5),
                        child: TextButton(
                          child: const Text(
                            'Tìm kiếm',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          onPressed: () {
                            searchDepartment(
                                _textEditingController.text.toString());
                          },
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Bấm vào thông tin khoa phòng để liên lạc',
                        style: TextStyle(
                            fontSize: 14.5, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              isLoading
                  ? Container(child: CircularProgressIndicator())
                  : Flexible(
                      child: FutureBuilder<DepartmentModel?>(
                          future: DemoAPI().dioGetDepartmentData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  //shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: _department.length,
                                  itemBuilder: (context, index) {
                                    if (_department.length != 0) {
                                      return Container(
                                          child: Container(
                                        margin: const EdgeInsets.all(20),
                                        //padding: EdgeInsets.only(right: 30, left: 30),
                                        height: 235,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 241, 239, 239),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _department[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 5,
                                                            left: 15,
                                                            right: 5),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 7,
                                                              ),
                                                              const Icon(
                                                                Icons
                                                                    .email_outlined,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                _department[
                                                                        index]
                                                                    .email,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Positioned(
                                                            right: 5,
                                                            child: Icon(Icons
                                                                .keyboard_arrow_right))
                                                      ],
                                                    ),
                                                  )),
                                              Divider(
                                                //Divider tạo dòng kẻ ngang
                                                color: Colors.blue[
                                                    700], // Màu của dòng kẻ
                                                thickness:
                                                    1.4, // Độ dày của dòng kẻ
                                                indent:
                                                    10, // Khoảng cách từ lề trái
                                                endIndent:
                                                    10, // Khoảng cách từ lề phải
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 15,
                                                      right: 5),
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
                                                              Icons
                                                                  .phone_android_outlined,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              _department[index]
                                                                  .phone,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Positioned(
                                                          right: 5,
                                                          child: Icon(Icons
                                                              .keyboard_arrow_right))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                //Divider tạo dòng kẻ ngang
                                                color: Colors.blue[
                                                    700], // Màu của dòng kẻ
                                                thickness:
                                                    1.4, // Độ dày của dòng kẻ
                                                indent:
                                                    10, // Khoảng cách từ lề trái
                                                endIndent:
                                                    10, // Khoảng cách từ lề phải
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 15,
                                                      right: 5),
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
                                                              Icons
                                                                  .location_on_outlined,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              _department[index]
                                                                  .address,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Positioned(
                                                          right: 5,
                                                          child: Icon(Icons
                                                              .keyboard_arrow_right))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                //Divider tạo dòng kẻ ngang
                                                color: Colors.blue[
                                                    700], // Màu của dòng kẻ
                                                thickness:
                                                    1.4, // Độ dày của dòng kẻ
                                                indent:
                                                    10, // Khoảng cách từ lề trái
                                                endIndent:
                                                    10, // Khoảng cách từ lề phải
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 15,
                                                      right: 5),
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
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Positioned(
                                                          right: 5,
                                                          child: Icon(Icons
                                                              .keyboard_arrow_right))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                    } else
                                      return Container(
                                        child: Text('Không có khoa phòng này'),
                                      );
                                  });
                            } else
                              return Container(
                                  child: CircularProgressIndicator());
                          }))
            ])));
  }

  void searchDepartment(String query) async {
    setState(() {
      isLoading = true;
    });
    final List<DepartmentData>? result = await getDataDepartmentFromApi();
    final suggestions = result!.where((element) {
      final departmentTitle = element.title.toLowerCase();
      final input = query.toLowerCase();
      return departmentTitle.contains(input);
    }).toList();
    setState(() {
      _department = suggestions;
      isLoading = false;
    });
  }
}
