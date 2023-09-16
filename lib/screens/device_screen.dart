//import 'dart:js_util';

import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/data_model.dart';
import 'package:appdemo/services/get_data_list.dart';
import 'package:appdemo/services/get_idDepartment.dart';
import 'package:appdemo/services/store.dart';
import 'package:appdemo/statusDevices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/models/detail_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});
  static String routeName = "device_screen";
  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;
  String _selectedState = all;
  String? _selectedDepartment;
  Future<List<Data>?> DataList() async {
    final List<Data>? dataList = await getDataFromApi();
    return dataList;
  }

  List<Data> _devices = [];
  void fetchData() async {
    _devices = (await DataList())!;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> _retryDataLoad() async {
    setState(() {}); // Đặt trạng thái lại để hiển thị tiêng chờ
    try {
      // Gọi lại hàm fetchData để tải lại dữ liệu
      // Xử lý dữ liệu sau khi tải lại thành công
      setState(() {
        fetchData();
      });
    } catch (error) {
      // Xử lý lỗi khi tải lại không thành công (hiển thị thông báo lỗi chẳng hạn)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Lỗi'),
            content: Text('Đã xảy ra lỗi khi tải dữ liệu: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng hộp thoại lỗi
                },
                child: Text('Đóng'),
              ),
            ],
          );
        },
      );
    }
  }

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
                            hintText: 'Tên thiết bị,mã thiết bị,...',
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
                            searchDevice(
                                _textEditingController.text.toString());
                          },
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
                              margin: const EdgeInsets.all(13),
                              width: 150,
                              padding: EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 232, 230, 230),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              alignment: Alignment.center,
                              child: Expanded(
                                child: TextButton(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '$_selectedState',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color:
                                              Color.fromARGB(255, 93, 92, 92),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) {
                                        return CupertinoPopupSurface(
                                          isSurfacePainted: false,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30))),
                                            height:
                                                500, // Điều chỉnh chiều cao của bottom sheet
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Expanded(
                                                  child:
                                                      CupertinoPicker.builder(
                                                    itemExtent:
                                                        40.0, // Chiều cao của mỗi item trong picker
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      // Xử lý khi phần tử được chọn thay đổi
                                                      setState(() {
                                                        _selectedState =
                                                            listStatus[index];
                                                        //searchOnStatusDevice();
                                                      });
                                                    },
                                                    childCount: listStatus
                                                        .length, // Số lượng phần tử
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      // Tùy chỉnh giao diện của ô hiển thị phần tử
                                                      return Center(
                                                        child: Container(
                                                          height: 40,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            listStatus[index],
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              color: Colors
                                                                  .black, // Màu văn bản
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CupertinoButton(
                                                      child: Text('Xác Nhận'),
                                                      onPressed:
                                                          applySelection),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5, right: 10),
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
                              height: 40,
                              margin: const EdgeInsets.all(13),
                              width: 150,
                              padding: EdgeInsets.only(top: 1),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 232, 230, 230),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              alignment: Alignment.center,
                              child: Expanded(
                                child: TextButton(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '$_selectedDepartment',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color:
                                              Color.fromARGB(255, 93, 92, 92),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) {
                                        return CupertinoPopupSurface(
                                          isSurfacePainted: false,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30))),
                                            height:
                                                500, // Điều chỉnh chiều cao của bottom sheet
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Expanded(
                                                  child:
                                                      CupertinoPicker.builder(
                                                    itemExtent:
                                                        40.0, // Chiều cao của mỗi item trong picker
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      // Xử lý khi phần tử được chọn thay đổi
                                                      setState(() {
                                                        _selectedState =
                                                            listStatus[index];
                                                        //searchOnStatusDevice();
                                                      });
                                                    },
                                                    childCount: listStatus
                                                        .length, // Số lượng phần tử
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      // Tùy chỉnh giao diện của ô hiển thị phần tử
                                                      return Center(
                                                        child: Container(
                                                          height: 40,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            listStatus[index],
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                              color: Colors
                                                                  .black, // Màu văn bản
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CupertinoButton(
                                                      child: Text('Xác Nhận'),
                                                      onPressed:
                                                          applySelection),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
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
              isLoading
                  ? Container(child: CircularProgressIndicator())
                  : Flexible(
                      child: FutureBuilder<GetDataModel?>(
                          future: DemoAPI().dioGetData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (_devices.isNotEmpty) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: _devices.length,
                                    itemBuilder: (context, index) {
                                      if (_devices.length != 0) {
                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsScreen(
                                                              _devices![index]
                                                                  as Data)));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(20),
                                              padding: const EdgeInsets.only(
                                                  right: 30, left: 30),
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 241, 239, 239),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Expanded(
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
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            _devices![index]
                                                                .title,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            'Model: ${_devices![index].model}',
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                            'Serial: ${_devices![index].serial}',
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                              'Trạng thái: ${_devices[index].status}',
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));
                                      } else
                                        return Container(
                                          child: Text('Không có thiết bị nào'),
                                        );
                                    });
                              } else
                                return Container(
                                  child: ElevatedButton(
                                    onPressed: _retryDataLoad,
                                    child: Text('Tải lại'),
                                  ),
                                );
                            } else
                              return Container(
                                  child: CircularProgressIndicator());
                          }))
            ])));
  }

  void searchDevice(String query) async {
    setState(() {
      isLoading = true;
    });
    final List<Data>? result = await getDataFromApi();
    final suggestions = result!.where((element) {
      final deviceTitle = element.title.toLowerCase();
      final input = query.toLowerCase();
      return deviceTitle.contains(input);
    }).toList();
    setState(() {
      _devices = suggestions;
      isLoading = false;
    });
  }

  void searchOnStatusDevice() async {
    setState(() {
      isLoading = true;
    });
    final List<Data>? result = await getDataFromApi();
    final suggestions = result!.where((element) {
      final deviceStatus = element.status.toLowerCase();
      final input = _selectedState!.toLowerCase();
      return deviceStatus.contains(input);
    }).toList();
    setState(() {
      _devices = suggestions;
      isLoading = false;
    });
  }

  void applySelection() {
    Navigator.of(context).pop();
    if (_selectedState == '$all') {
      searchDevice("");
    } else
      searchOnStatusDevice();
  }

  void searchOnDepartmentDevice() async {
    setState(() {
      isLoading = true;
    });
    final List<Data>? result = await getDataFromApi();
    final suggestions = result!.where((element) {
      final deviceStatus = element.status.toLowerCase();
      final input = _selectedState!.toLowerCase();
      return deviceStatus.contains(input);
    }).toList();
    setState(() {
      _devices = suggestions;
      isLoading = false;
    });
  }
}
