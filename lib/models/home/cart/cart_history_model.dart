import 'dart:convert';

CartHistoryModel cartHistoryModelFromJson(String str) =>
    CartHistoryModel.fromJson(json.decode(str));

String cartHistoryModelToJson(CartHistoryModel data) =>
    json.encode(data.toJson());

class CartHistoryModel {
  int? status;
  String? message;
  List<Data>? data;

  CartHistoryModel({this.status, this.message, this.data});

  CartHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;
  OrderDetail? orderDetail;

  Data({this.id, this.createdAt, this.updatedAt, this.orderDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderDetail = json['order_detail'] != null
        ? new OrderDetail.fromJson(json['order_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail!.toJson();
    }
    return data;
  }
}

class OrderDetail {
  int? productId;
  String? name;
  int? quantity;
  int? price;
  String? avatar;
  Variation? variation;

  OrderDetail(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.avatar,
      this.variation});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    avatar = json['avatar'];
    variation = json['variation'] != null
        ? new Variation.fromJson(json['variation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['avatar'] = this.avatar;
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    return data;
  }
}

class Variation {
  int? id;
  String? name;

  Variation({this.id, this.name});

  Variation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
