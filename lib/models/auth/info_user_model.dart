import 'dart:convert';

InfoUserModel infoUserModelFromJson(String str) =>
    InfoUserModel.fromJson(json.decode(str));

String infoUserModelToJson(InfoUserModel data) => json.encode(data.toJson());

class InfoUserModel {
  int? status;
  String? message;
  Data? data;

  InfoUserModel({this.status, this.message, this.data});

  InfoUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? phone;
  String? avatar;
  String? role;
  UserInfo? userInfo;

  Data({this.id, this.phone, this.avatar, this.role, this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    avatar = json['avatar'];
    role = json['role'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['role'] = role;
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? userId;
  String? fullname;
  String? birthday;
  String? gender;
  String? relationship;

  UserInfo(
      {this.userId,
      this.fullname,
      this.birthday,
      this.gender,
      this.relationship});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    birthday = json['birthday'];
    gender = json['gender'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['relationship'] = relationship;
    return data;
  }
}
