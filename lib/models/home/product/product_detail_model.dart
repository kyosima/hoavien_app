import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  int? status;
  String? message;
  Data? data;

  ProductDetailModel({this.status, this.message, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? size;
  String? avatar;
  String? detail;
  List<ProductGallery>? productGallery;
  List<ProductAttributes>? productAttributes;
  List<ProductReview>? productReview;

  Data(
      {this.id,
      this.name,
      this.price,
      this.size,
      this.avatar,
      this.detail,
      this.productGallery,
      this.productAttributes,
      this.productReview});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    size = json['size'];
    avatar = json['avatar'];
    detail = json['detail'];
    if (json['product_gallery'] != null) {
      productGallery = <ProductGallery>[];
      json['product_gallery'].forEach((v) {
        productGallery!.add(ProductGallery.fromJson(v));
      });
    }
    if (json['product_attributes'] != null) {
      productAttributes = <ProductAttributes>[];
      json['product_attributes'].forEach((v) {
        productAttributes!.add(ProductAttributes.fromJson(v));
      });
    }
    if (json['product_review'] != null) {
      productReview = <ProductReview>[];
      json['product_review'].forEach((v) {
        productReview!.add(ProductReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['size'] = size;
    data['avatar'] = avatar;
    data['detail'] = detail;
    if (productGallery != null) {
      data['product_gallery'] = productGallery!.map((v) => v.toJson()).toList();
    }
    if (productAttributes != null) {
      data['product_attributes'] =
          productAttributes!.map((v) => v.toJson()).toList();
    }
    if (productReview != null) {
      data['product_review'] = productReview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductGallery {
  int? productId;
  String? image;

  ProductGallery({this.productId, this.image});

  ProductGallery.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['image'] = image;
    return data;
  }
}

class ProductAttributes {
  int? id;
  int? productId;
  String? name;
  List<ProductAttributeVariation>? productAttributeVariation;

  ProductAttributes(
      {this.id, this.productId, this.name, this.productAttributeVariation});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    if (json['product_attribute_variation'] != null) {
      productAttributeVariation = <ProductAttributeVariation>[];
      json['product_attribute_variation'].forEach((v) {
        productAttributeVariation!.add(ProductAttributeVariation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['name'] = name;
    if (productAttributeVariation != null) {
      data['product_attribute_variation'] =
          productAttributeVariation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributeVariation {
  int? id;
  int? productAttributeId;
  String? name;
  int? price;

  ProductAttributeVariation(
      {this.id, this.productAttributeId, this.name, this.price});

  ProductAttributeVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productAttributeId = json['product_attribute_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['product_attribute_id'] = productAttributeId;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class ProductReview {
  int? id;
  int? productId;
  String? fullname;
  int? rating;

  ProductReview({this.id, this.productId, this.fullname, this.rating});

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    fullname = json['fullname'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['fullname'] = fullname;
    data['rating'] = rating;
    return data;
  }
}
