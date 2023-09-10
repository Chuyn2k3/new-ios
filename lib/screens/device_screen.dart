import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/data_model.dart';
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
  final TextEditingController _textEditingController = TextEditingController();
  List<Model> allModel = modelList;
  String _selectedState = "Đang sử dụng";
  var state = {
    'Đang sử dụng': 'ĐSD',
    'Đang báo hỏng': 'ĐBH',
    'Đang sửa chữa': 'ĐSC',
    'Ngừng sử dụng': 'NSD',
    'Đã thanh lý': 'ĐTL'
  };
  final String _selectedDepart = "Khoa mắt";
  var department = {
    'Khoa mắt': 'KM',
    'Khoa ung thư': 'UT',
    'Phụ khoa': 'PK',
  };
  List departments = [];
  departDependentDropDown() {
    state.forEach((key, value) {
      states.add(key);
    });
  }

  List states = [];
  StateDependentDropDown() {
    state.forEach((key, value) {
      states.add(key);
    });
  }

  List<Data?> api = [];
  @override
  void initState() {
    super.initState();
    StateDependentDropDown();
    //getData();
  }
//  Future<List<Data>> getData() async {
//     final result = await DemoAPI().dioGetData();
//     return result;
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Thiết Bị'),
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
                        onChanged: searchDevice,
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
                            Container(
                                height: 40,
                                margin: const EdgeInsets.all(10),
                                width: 150,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 232, 230, 230),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30))),
                                alignment: Alignment.center,
                                child: DropdownButton(
                                    underline: Container(),
                                    value: _selectedState,
                                    items: states.map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedState = "$newValue";
                                        selectedFilter = "$newValue";
                                        searchStateDevice();
                                      });
                                    }))
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
                              'Khoa phòng',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                height: 30,
                                margin: const EdgeInsets.all(10),
                                width: 120,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 232, 230, 230),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30))),
                                alignment: Alignment.center,
                                child: DropdownButton(
                                    underline: Container(),
                                    value: _selectedDepart,
                                    items: departments.map((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      //   setState(() {
                                      //     _selectedDepart = "$newValue";
                                      //     selectedFilterDepart = "$newValue";
                                      //     searchDepartDevice();
                                      //   });
                                    }))
                          ],
                        ),
                      ))
                ],
              ),
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
                  child: FutureBuilder<GetDataModel?>(
                      future: DemoAPI().dioGetData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             DetailsScreen(model)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(20),
                                      padding: const EdgeInsets.only(
                                          right: 30, left: 30),
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 241, 239, 239),
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data!.data![index].title,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Model: ${snapshot.data!.data![index].model}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'Serial: ${snapshot.data!.data![index].serial}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                  'Trạng thái: ${snapshot.data!.data![index].status}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                              });
                        } else
                          return Container(child: Text('error'));
                      }))
            ])));
  }

  void searchDevice(String query) {
    final suggestions = modelList.where((element) {
      final modelTitile = element.titile.toLowerCase();
      final input = query.toLowerCase();
      return modelTitile.contains(input);
    }).toList();
    setState(() {
      allModel = suggestions;
    });
  }

  static String selectedFilter = "Đang sử dụng";
  void searchStateDevice() {
    final suggestions = modelList.where((element) {
      final modelTitile = element.description.toLowerCase();
      final input = selectedFilter.toLowerCase();
      return modelTitile.contains(input);
    }).toList();
    setState(() {
      allModel = suggestions;
    });
  }

  // static String selectedFilterDepart = "Phu khoa";
  // void searchDepartDevice() {
  //   final suggestions = departmentList.where((element) {
  //     final modelTitile = element.name.toLowerCase();
  //     final input = selectedFilterDepart.toLowerCase();
  //     return modelTitile.contains(input);
  //   }).toList();

  //   setState(() {
  //     allModel = suggestions.equip;
  //   });
  // }
}
