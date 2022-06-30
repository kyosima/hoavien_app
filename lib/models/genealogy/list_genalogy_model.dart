import 'dart:convert';

ListGenealogyModel ListGenealogyModelFromJson(String str) =>
    ListGenealogyModel.fromJson(json.decode(str));

String ListGenealogyModelToJson(ListGenealogyModel data) =>
    json.encode(data.toJson());

class ListGenealogyModel {
  int? status;
  String? message;
  List<Data>? data;

  ListGenealogyModel({this.status, this.message, this.data});

  ListGenealogyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? address;
  String? createdAt;
  int? memberCount;

  Data({this.id, this.name, this.address, this.createdAt, this.memberCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    createdAt = json['created_at'];
    memberCount = json['member_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['member_count'] = this.memberCount;
    return data;
  }
}
