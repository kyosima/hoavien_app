import 'package:hoavien_app/models/second_account/second_account_model.dart';
import 'package:http/http.dart' as http;

class ApiSecondAccount {
  static var client = http.Client();
  static var baseURL = "http://server21.mevivu.com/apphoavien";
  static Future<SecondAccountModel?> addSecondAccount({
    String? fullname,
    String? relationship,
    String? phone,
    String? password,
    String? password_confirmation,
    String? addedby,
  }) async {
    var response = await client
        .post(Uri.parse('$baseURL/api/register-customer-secondary'), body: {
      'fullname': fullname,
      'relationship': relationship,
      'phone': phone,
      'password': password,
      'password_confirmation': password_confirmation,
      'addedby': addedby,
    });
    if (response.statusCode == 200) {
      return secondAccountModelFromJson(response.body);
    } else
      return null;
  }
}
