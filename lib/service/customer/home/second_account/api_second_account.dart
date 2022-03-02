import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiSecondAccount {
  static final client = http.Client();
  static Future<ListSecondAccountModel?> listSecondAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final id = await prefs.getInt('id');
    var response = await client
        .get(Uri.parse('$baseURL/api/list-customer-secondary?customer_id=$id'));
    if (response.statusCode == 200) {
      return listSecondAccountModelFromJson(response.body);
    } else
      return null;
  }
}
