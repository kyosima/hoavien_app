import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
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
}
