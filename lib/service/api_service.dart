import 'dart:convert';
import 'package:hoavien_app/models/auth/login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static var baseURL = "http://server21.mevivu.com/apphoavien";

  static Future<LoginModel?> login(
      {String? phoneNumber, String? passWord}) async {
    var response = await client.post(Uri.parse('$baseURL/api/user/login'),
        body: jsonEncode({'phone': '0909090909', 'password': '123456'}));
    if (response.statusCode == 200) {
      print(response.body.toString());

      return loginModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
