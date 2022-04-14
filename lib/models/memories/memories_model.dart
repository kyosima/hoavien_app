import 'dart:convert';

MemoriesModel memoriesModelFromJson(String str) =>
    MemoriesModel.fromJson(json.decode(str));

String memoriesModelToJson(MemoriesModel data) => json.encode(data.toJson());

class MemoriesModel {
  int? status;
  String? message;
  List<Data>? data;

  MemoriesModel({this.status, this.message, this.data});

  MemoriesModel.fromJson(Map<String, dynamic> json) {
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
  String? link;
  String? thumbnail;

  Data({this.id, this.link, this.thumbnail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['link'] = link;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
