import 'dart:convert';

ComboDetailModel comboDetailModelFromJson(String str) =>
    ComboDetailModel.fromJson(json.decode(str));

String comboDetailModelToJson(ComboDetailModel data) =>
    json.encode(data.toJson());

class ComboDetailModel {
  int? status;
  String? message;
  Data? data;

  ComboDetailModel({this.status, this.message, this.data});

  ComboDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? price;
  int? pricePromotion;
  String? avatar;
  String? detail;
  List<ComboReview>? comboReview;

  Data(
      {this.id,
      this.name,
      this.price,
      this.pricePromotion,
      this.avatar,
      this.detail,
      this.comboReview});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePromotion = json['price_promotion'];
    avatar = json['avatar'];
    detail = json['detail'];
    if (json['combo_review'] != null) {
      comboReview = <ComboReview>[];
      json['combo_review'].forEach((v) {
        comboReview!.add(ComboReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_promotion'] = pricePromotion;
    data['avatar'] = avatar;
    data['detail'] = detail;
    if (comboReview != null) {
      data['combo_review'] = comboReview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComboReview {
  double? rating;
  String? fullname;

  ComboReview({this.rating, this.fullname});

  ComboReview.fromJson(Map<String, dynamic> json) {
    rating = double.parse(json['rating'].toString());
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rating'] = rating;
    data['fullname'] = fullname;
    return data;
  }
}
