
class DepartmentModel {
  int? statusCode;
  List<DepartmentData>? data;
  int? dataLength;

  DepartmentModel({this.statusCode, this.data, this.dataLength});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    if(json["status_code"] is int) {
      statusCode = json["status_code"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => DepartmentData.fromJson(e)).toList();
    }
    if(json["dataLength"] is int) {
      dataLength = json["dataLength"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_code"] = statusCode;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["dataLength"] = dataLength;
    return _data;
  }
}

class DepartmentData {
  int? id;
  late String title;
  String? code;
  String? slug;
  late String phone;
  String? contact;
  late String email;
  late String address;
  int? userId;
  dynamic authorId;
  int? nursingId;
  dynamic image;
  String? createdAt;
  String? updatedAt;
  String? browser;
  String? browserDay;

  DepartmentData({this.id,required this.title, this.code, this.slug,required this.phone, this.contact,required this.email,required this.address, this.userId, this.authorId, this.nursingId, this.image, this.createdAt, this.updatedAt, this.browser, this.browserDay});

  DepartmentData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["contact"] is String) {
      contact = json["contact"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    authorId = json["author_id"];
    if(json["nursing_id"] is int) {
      nursingId = json["nursing_id"];
    }
    image = json["image"];
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["browser"] is String) {
      browser = json["browser"];
    }
    if(json["browser_day"] is String) {
      browserDay = json["browser_day"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["code"] = code;
    _data["slug"] = slug;
    _data["phone"] = phone;
    _data["contact"] = contact;
    _data["email"] = email;
    _data["address"] = address;
    _data["user_id"] = userId;
    _data["author_id"] = authorId;
    _data["nursing_id"] = nursingId;
    _data["image"] = image;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["browser"] = browser;
    _data["browser_day"] = browserDay;
    return _data;
  }
}