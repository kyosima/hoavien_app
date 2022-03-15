import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:hoavien_app/models/home/product/product_detail_model.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static var client = http.Client();
  static Future<ProductModel?> getProduct() async {
    var response =
        await client.get(Uri.parse('$baseURL/api/list-product'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ProductDetailModel?> getProductDetails({String? id}) async {
    var response = await client
        .get(Uri.parse('$baseURL/api/show-product?product_id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return productDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ProductModel?> getRelatedProduct({String? id}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/related-product?product_id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> rateProduct(
      {String? idProduct, String? idUser, String? rate}) async {
    var response = await client
        .post(Uri.parse('$baseURL/api/create-review-product'), body: {
      "product_id": idProduct,
      "user_id": idUser,
      "rating": rate,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
