import 'dart:convert';

TaisansoModel taisansoModelFromJson(String str) =>
    TaisansoModel.fromJson(json.decode(str));

String taisansoModelToJson(TaisansoModel data) => json.encode(data.toJson());

class TaisansoModel {
  int? status;
  String? message;
  Data? data;

  TaisansoModel({this.status, this.message, this.data});

  TaisansoModel.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<DataTaisanso>? dataTaisanso;
  int? lastPage;

  Data({this.currentPage, this.dataTaisanso, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataTaisanso = <DataTaisanso>[];
      json['data'].forEach((v) {
        dataTaisanso!.add(DataTaisanso.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (dataTaisanso != null) {
      data['data'] = dataTaisanso!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = lastPage;
    return data;
  }
}

class DataTaisanso {
  int? id;
  int? digitalAssetAreaId;
  int? saleId;
  int? customerId;
  String? name;
  int? price;
  String? avatar;
  int? status;
  String? shortDetail;
  Customer? customer;
  Area? area;

  DataTaisanso(
      {this.id,
      this.digitalAssetAreaId,
      this.saleId,
      this.customerId,
      this.name,
      this.price,
      this.avatar,
      this.status,
      this.shortDetail,
      this.customer,
      this.area});

  DataTaisanso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalAssetAreaId = json['digital_asset_area_id'];
    saleId = json['sale_id'];
    customerId = json['customer_id'];
    name = json['name'];
    price = json['price'];
    avatar = json['avatar'];
    status = json['status'];
    shortDetail = json['short_detail'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digital_asset_area_id'] = digitalAssetAreaId;
    data['sale_id'] = saleId;
    data['customer_id'] = customerId;
    data['name'] = name;
    data['price'] = price;
    data['avatar'] = avatar;
    data['status'] = status;
    data['short_detail'] = shortDetail;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (area != null) {
      data['area'] = area!.toJson();
    }
    return data;
  }
}

class Customer {
  int? userId;
  String? fullname;

  Customer({this.userId, this.fullname});

  Customer.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    return data;
  }
}

class Area {
  int? id;
  int? parentId;
  String? name;
  Parent? parent;

  Area({this.id, this.parentId, this.name, this.parent});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    return data;
  }
}

class Parent {
  int? id;
  String? name;

  Parent({this.id, this.name});

  Parent.fromJson(Map<String, dynamic> json) {
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
