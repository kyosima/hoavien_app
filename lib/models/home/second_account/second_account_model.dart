// To parse this JSON data, do
//
//     final secondAccountModel = secondAccountModelFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

SecondAccountModel secondAccountModelFromJson(String str) =>
    SecondAccountModel.fromJson(json.decode(str));

String secondAccountModelToJson(SecondAccountModel data) =>
    json.encode(data.toJson());

class SecondAccountModel {
  int? status;
  String? message;
  Data? data;

  SecondAccountModel({this.status, this.message, this.data});

  SecondAccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? phone;
  String? role;
  File? avatar;
  UserInfo? userInfo;

  Data({this.id, this.phone, this.role, this.avatar, this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    role = json['role'];
    avatar = json['avatar'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['role'] = role;
    data['avatar'] = this.avatar;
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? userId;
  String? fullname;
  String? relationship;

  UserInfo({this.userId, this.fullname, this.relationship});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['relationship'] = relationship;
    return data;
  }
}
