import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/info_user_model.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InfoUserService {
  static final client = http.Client();
  static Future<InfoUserModel?> infoUser() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    var response = await client
        .get(Uri.parse('$baseURL/api/info-user?user_id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return infoUserModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<StatusModel?> updateInfoUser({
    String? id,
    String? fullname,
    String? birthday,
    String? gender,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    var response =
        await client.put(Uri.parse('$baseURL/api/update-info-user'), body: {
      'id': id.toString(),
      'fullname': fullname,
      'gender': gender,
      'birthday': birthday,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
