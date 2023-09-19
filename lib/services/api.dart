

import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/devices/device_model.dart';
import 'package:appdemo/departments/department_model.dart';
import 'package:appdemo/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:appdemo/services/store.dart';



class DemoAPI {
  late final Dio _dio;
  DemoAPI() {
    _dio = Dio();
  }
  final String _loginUrl = 'http://bvdemo.qltbyt.com/api/login';
  final String _dataUrl = 'http://bvdemo.qltbyt.com/api/v1/equipments';
  final String _departmentUrl = 'http://bvdemo.qltbyt.com/api/v1/departments';
  final String _employeeUrl = 'http://bvdemo.qltbyt.com/api/v1/users';
  Map<String, dynamic> get _loginData =>
      {"email": "ibme.lab@gmail.com", "password": "12345689bvka"};

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  }

  Future<UserModel?> diologin() async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: _loginData,
      );
      await _saveToken(response.data);
      return UserModel.fromJson((response.data));
    } catch (e) {
      // ignore_for_file: avoid_print
      print(e);
    }
    return null;
  }

  Future<DeviceModel?> dioGetDeviceData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _dataUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return DeviceModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<DepartmentModel?> dioGetDepartmentData() async {
    try {
      _dio.options.headers['Authorization'] =
          'Bearer ${await Store.getToken()}';
      final response = await _dio.get(
        _departmentUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return DepartmentModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<EmployeeModel?> dioGetEmployeeData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _employeeUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      try {
        return EmployeeModel.fromJson(response.data);
      } catch (e) {
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
