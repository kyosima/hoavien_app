import 'dart:convert';

ServiceDetailModel serviceDetailModelFromJson(String str) =>
    ServiceDetailModel.fromJson(json.decode(str));

String serviceDetailModelToJson(ServiceDetailModel data) =>
    json.encode(data.toJson());

class ServiceDetailModel {
  int? status;
  String? message;
  Data? data;

  ServiceDetailModel({this.status, this.message, this.data});

  ServiceDetailModel.fromJson(Map<String, dynamic> json) {
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
  List<ServiceAttribute>? serviceAttribute;
  List<ServiceReview>? serviceReview;

  Data(
      {this.id,
      this.name,
      this.price,
      this.pricePromotion,
      this.avatar,
      this.detail,
      this.serviceAttribute,
      this.serviceReview});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePromotion = json['price_promotion'];
    avatar = json['avatar'];
    detail = json['detail'];
    if (json['service_attribute'] != null) {
      serviceAttribute = <ServiceAttribute>[];
      json['service_attribute'].forEach((v) {
        serviceAttribute!.add(ServiceAttribute.fromJson(v));
      });
    }
    if (json['service_review'] != null) {
      serviceReview = <ServiceReview>[];
      json['service_review'].forEach((v) {
        serviceReview!.add(ServiceReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_promotion'] = pricePromotion;
    data['avatar'] = avatar;
    data['detail'] = detail;
    if (serviceAttribute != null) {
      data['service_attribute'] =
          serviceAttribute!.map((v) => v.toJson()).toList();
    }
    if (serviceReview != null) {
      data['service_review'] = serviceReview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceAttribute {
  int? id;
  String? name;
  List<ServiceAttributeVariation>? serviceAttributeVariation;

  ServiceAttribute({this.id, this.name, this.serviceAttributeVariation});

  ServiceAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['service_attribute_variation'] != null) {
      serviceAttributeVariation = <ServiceAttributeVariation>[];
      json['service_attribute_variation'].forEach((v) {
        serviceAttributeVariation!.add(ServiceAttributeVariation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (serviceAttributeVariation != null) {
      data['service_attribute_variation'] =
          serviceAttributeVariation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceAttributeVariation {
  int? id;
  String? name;
  int? price;

  ServiceAttributeVariation({this.id, this.name, this.price});

  ServiceAttributeVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class ServiceReview {
  double? rating;
  String? fullname;

  ServiceReview({this.rating, this.fullname});

  ServiceReview.fromJson(Map<String, dynamic> json) {
    rating = double.parse(json['rating'].toString());
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['fullname'] = fullname;
    return data;
  }
}
