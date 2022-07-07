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
  int? digitalAssetAreaId;
  int? customerId;
  String? name;
  int? status;
  String? avatar;
  String? detail;
  String? map;
  String? sale_contract;
  String? certificate;
  String? construction_contract;
  Area? area;
  List<Gallery>? gallery;
  Customer? customer;
  List<Related>? related;

  Data({
    this.map,
    this.certificate,
    this.construction_contract,
    this.sale_contract,
    this.id,
    this.digitalAssetAreaId,
    this.customerId,
    this.name,
    this.status,
    this.avatar,
    this.detail,
    this.area,
    this.gallery,
    this.customer,
    this.related,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalAssetAreaId = json['digital_asset_area_id'];
    customerId = json['customer_id'];
    name = json['name'];
    status = json['status'];
    avatar = json['avatar'];
    detail = json['detail'];
    map = json['map'];
    sale_contract = json['sale_contract'];
    construction_contract = json['construction_contract'];
    certificate = json['certificate'];
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['related'] != null) {
      related = <Related>[];
      json['related'].forEach((v) {
        related!.add(Related.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digital_asset_area_id'] = digitalAssetAreaId;
    data['customer_id'] = customerId;
    data['name'] = name;
    data['status'] = status;
    data['avatar'] = avatar;
    data['detail'] = detail;
    data['map'] = map;
    data['sale_contract'] = sale_contract;
    data['construction_contract'] = construction_contract;
    data['certificate'] = certificate;
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (related != null) {
      data['related'] = related!.map((v) => v.toJson()).toList();
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

class Gallery {
  int? digitalAssetsId;
  String? image;

  Gallery({this.digitalAssetsId, this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    digitalAssetsId = json['digital_assets_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['digital_assets_id'] = digitalAssetsId;
    data['image'] = image;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['avatar'] = avatar;
    data['short_detail'] = shortDetail;
    return data;
  }
}
