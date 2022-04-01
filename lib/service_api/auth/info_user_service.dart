import 'dart:io';

import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/info_user_model.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

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
    File? avatar,
  }) async {
    if (avatar != null) {
      var stream = http.ByteStream(DelegatingStream.typed(avatar.openRead()));
      var length = await avatar.length();
      var request = http.MultipartRequest(
          "POST", Uri.parse('$baseURL/api/update-info-user'));
      var multipartFile = http.MultipartFile('avatar', stream, length,
          filename: basename(avatar.path));
      var body = {
        'id': id.toString(),
        'fullname': fullname ?? '',
        'gender': gender ?? '',
        'birthday': birthday ?? '',
      };
      request.files.add(multipartFile);
      request.fields.addAll(body);
      var response = await request.send();
      return StatusModel(
        status: response.statusCode,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt('id');
      var response =
          await client.post(Uri.parse('$baseURL/api/update-info-user'), body: {
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

  static Future<StatusModel?> changePassword(
      {String? id,
      String? password,
      String? newPassword,
      String? confirmNewpassword}) async {
    var response =
        await client.put(Uri.parse('$baseURL/api/update-password-user'), body: {
      'id': id,
      'password': password,
      'new_password_confirmation': confirmNewpassword,
      'new_password': newPassword,
    });
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
