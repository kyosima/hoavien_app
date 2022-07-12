import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  int? status;
  String? message;
  List<Data>? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  Content? content;
  int? status;

  Data({this.id, this.content, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (content != null) {
      data['content'] = content!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Content {
  int? productId;
  String? name;
  int? quantity;
  int? price;
  String? avatar;
  Variation? variation;

  Content(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.avatar,
      this.variation});

  Content.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    avatar = json['avatar'];
    variation = json['variation'] != null
        ? Variation.fromJson(json['variation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['avatar'] = avatar;
    if (variation != null) {
      data['variation'] = variation!.toJson();
    }
    return data;
  }
}

class Variation {
  Null? id;
  String? name;

  Variation({this.id, this.name});

  Variation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
