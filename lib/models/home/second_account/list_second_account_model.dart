// To parse this JSON data, do
//
//     final listSecondAccountModel = listSecondAccountModelFromJson(jsonString);

import 'dart:convert';

ListSecondAccountModel listSecondAccountModelFromJson(String str) =>
    ListSecondAccountModel.fromJson(json.decode(str));

String listSecondAccountModelToJson(ListSecondAccountModel data) =>
    json.encode(data.toJson());

class ListSecondAccountModel {
  int? status;
  String? message;
  List<Data>? data;

  ListSecondAccountModel({this.status, this.message, this.data});

  ListSecondAccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
