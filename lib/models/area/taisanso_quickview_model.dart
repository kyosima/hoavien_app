import 'dart:convert';

TaisansoQuickviewModel taisansoQuickviewModelFromJson(String str) =>
    TaisansoQuickviewModel.fromJson(json.decode(str));

String taisansoQuickviewModelToJson(TaisansoQuickviewModel data) =>
    json.encode(data.toJson());

class TaisansoQuickviewModel {
  int? status;
  String? message;
  Data? data;

  TaisansoQuickviewModel({this.status, this.message, this.data});

  TaisansoQuickviewModel.fromJson(Map<String, dynamic> json) {
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
  int? digitalAssetSizeId;
  String? name;
  int? status;
  int? price;
  int? priceTakeCare;
  int? priceCoffin;
  Area? area;
  Size? size;

  Data(
      {this.id,
      this.digitalAssetAreaId,
      this.digitalAssetSizeId,
      this.name,
      this.status,
      this.price,
      this.priceTakeCare,
      this.priceCoffin,
      this.area,
      this.size});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalAssetAreaId = json['digital_asset_area_id'];
    digitalAssetSizeId = json['digital_asset_size_id'];
    name = json['name'];
    status = json['status'];
    price = json['price'];
    priceTakeCare = json['price_take_care'];
    priceCoffin = json['price_coffin'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_asset_area_id'] = this.digitalAssetAreaId;
    data['digital_asset_size_id'] = this.digitalAssetSizeId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['price'] = this.price;
    data['price_take_care'] = this.priceTakeCare;
    data['price_coffin'] = this.priceCoffin;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.size != null) {
      data['size'] = this.size!.toJson();
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

class Size {
  int? id;
  double? length;
  double? width;
  int? quantity;

  Size({this.id, this.length, this.width, this.quantity});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    length = double.parse(json['length'].toString());
    width = double.parse(json['width'].toString());
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['length'] = this.length;
    data['width'] = this.width;
    data['quantity'] = this.quantity;
    return data;
  }
}
