import 'dart:convert';

ComboModel comboModelFromJson(String str) =>
    ComboModel.fromJson(json.decode(str));

String comboModelToJson(ComboModel data) => json.encode(data.toJson());

class ComboModel {
  int? status;
  String? message;
  List<Data>? data;

  ComboModel({this.status, this.message, this.data});

  ComboModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? price;
  int? pricePromotion;
  String? avatar;
  String? shortDetail;

  Data(
      {this.id,
      this.name,
      this.price,
      this.pricePromotion,
      this.avatar,
      this.shortDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePromotion = json['price_promotion'];
    avatar = json['avatar'];
    shortDetail = json['short_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_promotion'] = pricePromotion;
    data['avatar'] = avatar;
    data['short_detail'] = shortDetail;
    return data;
  }
}
