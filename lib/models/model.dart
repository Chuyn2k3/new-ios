import 'package:flutter/material.dart';

class Model {
  late String titile;
  late String description;
  //late String imageUrl;
  late int yearUse;
  late int yearMan;
  late String model;
  late String serial;
  late String manufacturer;
  late String origin;

  Model({
    required this.titile,
    required this.description,
    required this.yearUse,
    required this.yearMan,
    required this.model,
    required this.serial,
    required this.manufacturer,
    required this.origin,
  });
}
List<Model> modelList = [
  Model(
      titile: 'hút dịch Yuwell',
      description: 'Đã thanh lý',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00434',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Đang báo hỏng',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00433',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Đang sử dụng',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00431',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Đã thanh lý',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00439',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Đã thanh lý',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00432',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Đang sửa chữa',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00455',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  Model(
      titile: 'Máy hút dịch Yuwell',
      description: 'Ngưng sử dụng',
      //imageUrl: imageUrl,
      yearUse: 2018,
      yearMan: 2018,
      model: '7E-A',
      serial: '00450',
      manufacturer: 'Jiangsu yuyue',
      origin: 'Trung Quốc'),
  
];
