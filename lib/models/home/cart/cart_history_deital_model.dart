import 'dart:convert';

CartHistoryDetailModel cartHistoryDetailModelFromJson(String str) =>
    CartHistoryDetailModel.fromJson(json.decode(str));

String cartHistoryDetailModelToJson(CartHistoryDetailModel data) =>
    json.encode(data.toJson());

class CartHistoryDetailModel {
  int? status;
  String? message;
  List<Data>? data;

  CartHistoryDetailModel({this.status, this.message, this.data});

  CartHistoryDetailModel.fromJson(Map<String, dynamic> json) {
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
  int? tax;
  int? total;
  String? dateUse;
  DigitalAssetUse? digitalAssetUse;
  Contact? contact;
  String? createdAt;
  String? updatedAt;
  List<OrderDetails>? orderDetails;

  Data(
      {this.id,
      this.tax,
      this.total,
      this.dateUse,
      this.digitalAssetUse,
      this.contact,
      this.createdAt,
      this.updatedAt,
      this.orderDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    total = json['total'];
    dateUse = json['date_use'];
    digitalAssetUse = json['digital_asset_use'] != null
        ? new DigitalAssetUse.fromJson(json['digital_asset_use'])
        : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['date_use'] = this.dateUse;
    if (this.digitalAssetUse != null) {
      data['digital_asset_use'] = this.digitalAssetUse!.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DigitalAssetUse {
  int? id;
  int? digitalAssetAreaId;
  int? customerId;
  String? name;
  int? row;
  int? column;
  int? digitalAssetSizeId;
  String? avatar;
  Area? area;
  Size? size;

  DigitalAssetUse(
      {this.id,
      this.digitalAssetAreaId,
      this.customerId,
      this.name,
      this.row,
      this.column,
      this.digitalAssetSizeId,
      this.avatar,
      this.area,
      this.size});

  DigitalAssetUse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalAssetAreaId = json['digital_asset_area_id'];
    customerId = json['customer_id'];
    name = json['name'];
    row = json['row'];
    column = json['column'];
    digitalAssetSizeId = json['digital_asset_size_id'];
    avatar = json['avatar'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_asset_area_id'] = this.digitalAssetAreaId;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['row'] = this.row;
    data['column'] = this.column;
    data['digital_asset_size_id'] = this.digitalAssetSizeId;
    data['avatar'] = this.avatar;
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
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
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
  int? width;

  Size({this.id, this.length, this.width});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    length = json['length'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['length'] = this.length;
    data['width'] = this.width;
    return data;
  }
}

class Contact {
  String? fullname;
  String? phone;
  Null? address;

  Contact({this.fullname, this.phone, this.address});

  Contact.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}

class OrderDetails {
  int? orderId;
  Content? content;

  OrderDetails({this.orderId, this.content});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Content {
  int? productId;
  String? name;
  int? quantity;
  int? price;
  String? avatar;

  Content({this.productId, this.name, this.quantity, this.price, this.avatar});

  Content.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['avatar'] = this.avatar;
    return data;
  }
}
