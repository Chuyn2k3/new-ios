import 'dart:convert';
import 'dart:math';

import 'package:appdemo/services/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/interceptors/dio_interceptor.dart';
import 'package:appdemo/services/store.dart';

class DemoAPI {
  late final Dio _dio;
  DemoAPI() {
    _dio = Dio();
    //_dio.interceptors.add(DioInterceptor());
  }
  final String _loginUrl = 'http://bvdemo.qltbyt.com/api/login';
  final String _dataUrl = 'http://bvdemo.qltbyt.com/api/v1/equipments';
  // Map<String, dynamic> get _loginData =>
  //     {"email": "ibme.lab@gmail.com", "password": "12345689bvka"};

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  }

  Future<void> diologin() async {
    final response = await _dio.post(
      _loginUrl,
      data: FormData.fromMap(
          {"email": "ibme.lab@gmail.com", "password": "12345689bvka"}),
    );
    if (response.statusCode == 200) {
      await _saveToken(response.data);
    } else
      print('error');
  }

  Future<GetDataModel?> dioGetData() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${Store.getToken()}';
      final response = await _dio.get(
        _dataUrl,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        return GetDataModel.fromJson(response.data);
      } else {
        // Xử lý lỗi ở đây và trả về null hoặc giá trị mặc định tùy vào nhu cầu.
        print('Lỗi khi lấy dữ liệu. Mã trạng thái: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Xử lý bất kỳ lỗi nào khác xảy ra ở đây.
      return null;
    }
  }
}
