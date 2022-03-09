import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<UserModel?> login(
      {String? phoneNumber, String? passWord}) async {
    var response = await client.post(Uri.parse('$baseURL/api/user/login'),
        body: {'phone': phoneNumber, 'password': passWord});
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
