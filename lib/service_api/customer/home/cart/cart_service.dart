import 'dart:convert';

import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:hoavien_app/models/home/cart/cart_history_detail_model.dart';
import 'package:hoavien_app/models/home/cart/cart_history_model.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
import 'package:hoavien_app/models/home/cart/cart_taisanso_model.dart';
import 'package:http/http.dart' as http;

class CartService {
  static var client = http.Client();
  static Future<StatusModel?> addToCart(
      {String? productId, String? userId, String? variationId}) async {
    var response =
        await client.post(Uri.parse('$baseURL/api/cart/create'), body: {
      'user_id': userId ?? '',
      'product_id': productId ?? '',
      'variation_id': variationId ?? '',
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<CartModel?> getCartInfo({String? userId}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/cart?user_id=$userId'),
        headers: {'X-TOKEN-ACCESS': tokenAccess});
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> updateProductCart(
      {String? id, String? userId, String? quantity}) async {
    var reponse =
        await client.put(Uri.parse('$baseURL/api/cart/update'), body: {
      "id": id ?? '',
      "user_id": userId ?? '',
      "quantity": quantity ?? '',
    });
    if (reponse.statusCode == 200) {
      return statusModelFromJson(reponse.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> deleteProductCart(
      {String? id, String? userId}) async {
    var response =
        await client.delete(Uri.parse('$baseURL/api/cart/delete'), body: {
      "id": id ?? '',
      "user_id": userId ?? '',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<CartTaisansoModel?> getCartTaisanso({String? userId}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/digital-asset/simple?customer_id=$userId'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return cartTaisansoModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> createOrder(
      {String? userId,
      String? taisansoId,
      List<dynamic>? itemId,
      String? dateUse,
      String? fullName,
      String? phoneNumber,
      String? note}) async {
    var url = "$baseURL/api/order/create";
    var response = await client.post(Uri.parse(url), body: {
      "user_id": userId,
      "digital_asset_id": taisansoId,
      "item_id": json.encode(itemId),
      "date_use": dateUse,
      "fullname": fullName,
      "phone": phoneNumber,
      "address": "",
      "note": note
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<CartHistoryModel?> getCartHistory(
      {String? userId, String? status}) async {
    var reponse = await client.get(
        Uri.parse('$baseURL/api/order?user_id=$userId&status=$status'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });

    if (reponse.statusCode == 200) {
      return cartHistoryModelFromJson(reponse.body);
    } else {
      return null;
    }
  }

  static Future<CartHistoryDetailModel?> getCartHistoryDetail(
      {String? userId, String? id}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/order/show?user_id=$userId&id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return cartHistoryDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> changeOrderStatus(
      {String? id, String? userId, String? status}) async {
    var response =
        await client.put(Uri.parse('$baseURL/api/order/update'), body: {
      "id": id,
      "user_id": userId,
      "status": status,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
