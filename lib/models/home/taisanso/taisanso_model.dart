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
  int? currentPage;
  List<DataTaisanso>? dataTaisanso;
  int? lastPage;

  Data({this.currentPage, this.dataTaisanso, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataTaisanso = <DataTaisanso>[];
      json['data'].forEach((v) {
        dataTaisanso!.add(new DataTaisanso.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataTaisanso != null) {
      data['data'] = this.dataTaisanso!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this.lastPage;
    return data;
  }
}

class DataTaisanso {
  int? id;
  int? digitalAssetAreaId;
  Null? saleId;
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
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_asset_area_id'] = this.digitalAssetAreaId;
    data['sale_id'] = this.saleId;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['short_detail'] = this.shortDetail;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['fullname'] = this.fullname;
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
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
