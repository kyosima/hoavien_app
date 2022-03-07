import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiSecondAccount {
  static final client = http.Client();
  static Future<ListSecondAccountModel?> listSecondAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    var response = await client.get(
        Uri.parse('$baseURL/api/list-customer-secondary?customer_id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return listSecondAccountModelFromJson(response.body);
    } else
      return null;
  }

  static Future<StatusModel?> deleteSecondAccount(
      {String? id, String? addedby}) async {
    var response = await client
        .delete(Uri.parse('$baseURL/api/delete-customer-secondary'), body: {
      'id': id,
      'addedby': addedby,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else
      return null;
  }

  static Future<StatusModel?> editSecondAccount(
      {String? id,
      String? addedby,
      String? fullName,
      String? relationship,
      String? phone,
      String? password,
      String? confirmPassword}) async {
    var response = await client
        .put(Uri.parse('$baseURL/api/update-customer-secondary'), body: {
      'id': id,
      'addedby': addedby,
      'fullname': fullName,
      'relationship': relationship,
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else
      return null;
  }
}
