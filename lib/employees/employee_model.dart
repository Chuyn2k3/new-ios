
class EmployeeModel {
  List<EmployeeData>? data;
  int? dataLength;

  EmployeeModel({this.data, this.dataLength});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => EmployeeData.fromJson(e)).toList();
    }
    if(json["dataLength"] is int) {
      dataLength = json["dataLength"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["dataLength"] = dataLength;
    return _data;
  }
}

class EmployeeData {
  int? id;
  String? name;
  late String email;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  late String displayname;
  dynamic image;
  dynamic address;
  dynamic birthday;
  late String phone;
  int? departmentId;
  String? gender;
  int? isDisabled;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  EmployeeData({this.id, this.name,required this.email, this.emailVerifiedAt, this.currentTeamId,required this.displayname, this.image, this.address, this.birthday,required this.phone, this.departmentId, this.gender, this.isDisabled, this.createdAt, this.updatedAt, this.profilePhotoUrl});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    emailVerifiedAt = json["email_verified_at"];
    currentTeamId = json["current_team_id"];
    if(json["displayname"] is String) {
      displayname = json["displayname"];
    }
    image = json["image"];
    address = json["address"];
    birthday = json["birthday"];
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["department_id"] is int) {
      departmentId = json["department_id"];
    }
    if(json["gender"] is String) {
      gender = json["gender"];
    }
    if(json["is_disabled"] is int) {
      isDisabled = json["is_disabled"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["profile_photo_url"] is String) {
      profilePhotoUrl = json["profile_photo_url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["current_team_id"] = currentTeamId;
    _data["displayname"] = displayname;
    _data["image"] = image;
    _data["address"] = address;
    _data["birthday"] = birthday;
    _data["phone"] = phone;
    _data["department_id"] = departmentId;
    _data["gender"] = gender;
    _data["is_disabled"] = isDisabled;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["profile_photo_url"] = profilePhotoUrl;
    return _data;
  }
}