import 'dart:convert';

TaisansoDetailModel taisansoDetailModelFromJson(String str) =>
    TaisansoDetailModel.fromJson(json.decode(str));

String taisansoDetailModelToJson(TaisansoDetailModel data) =>
    json.encode(data.toJson());

class TaisansoDetailModel {
  int? status;
  String? message;
  Data? data;

  TaisansoDetailModel({this.status, this.message, this.data});

  TaisansoDetailModel.fromJson(Map<String, dynamic> json) {
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
  int? digitalAssetAreaId;
  int? customerId;
  String? name;
  int? status;
  String? avatar;
  String? detail;
  Area? area;
  List<Gallery>? gallery;
  Customer? customer;
  List<Related>? related;

  Data(
      {this.id,
      this.digitalAssetAreaId,
      this.customerId,
      this.name,
      this.status,
      this.avatar,
      this.detail,
      this.area,
      this.gallery,
      this.customer,
      this.related});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalAssetAreaId = json['digital_asset_area_id'];
    customerId = json['customer_id'];
    name = json['name'];
    status = json['status'];
    avatar = json['avatar'];
    detail = json['detail'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['related'] != null) {
      related = <Related>[];
      json['related'].forEach((v) {
        related!.add(new Related.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_asset_area_id'] = this.digitalAssetAreaId;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['avatar'] = this.avatar;
    data['detail'] = this.detail;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.related != null) {
      data['related'] = this.related!.map((v) => v.toJson()).toList();
    }
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

class Gallery {
  int? digitalAssetsId;
  String? image;

  Gallery({this.digitalAssetsId, this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    digitalAssetsId = json['digital_assets_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['digital_assets_id'] = this.digitalAssetsId;
    data['image'] = this.image;
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

class Related {
  int? id;
  String? name;
  int? price;
  String? avatar;
  String? shortDetail;

  Related({this.id, this.name, this.price, this.avatar, this.shortDetail});

  Related.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    avatar = json['avatar'];
    shortDetail = json['short_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['avatar'] = this.avatar;
    data['short_detail'] = this.shortDetail;
    return data;
  }
}
