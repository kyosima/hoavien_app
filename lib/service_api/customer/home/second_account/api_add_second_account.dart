import 'dart:io';
import 'package:hoavien_app/constance.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:async/async.dart';

class ApiAddSecondAccount {
  static var client = http.Client();
  static Future<int?> addSecondAccount({
    String? fullname,
    String? relationship,
    String? phone,
    String? password,
    String? password_confirmation,
    String? addedby,
    File? avatar,
  }) async {
    if (avatar != null) {
      var stream = http.ByteStream(DelegatingStream.typed(avatar.openRead()));
      var length = await avatar.length();
      var uri = Uri.parse('$baseURL/api/register-customer-secondary');
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile('avatar', stream, length,
          filename: basename(avatar.path));
      var body = {
        'fullname': fullname ?? "",
        'relationship': relationship ?? "",
        'phone': phone ?? "",
        'password': password ?? "",
        'password_confirmation': password_confirmation ?? "",
        'addedby': addedby ?? "",
      };

      request.files.add(multipartFile);
      request.fields.addAll(body);
      var response = await request.send();
      return response.statusCode;
    } else {
      var uri = Uri.parse('$baseURL/api/register-customer-secondary');
      var request = http.MultipartRequest("POST", uri);

      var body = {
        'fullname': fullname ?? "",
        'relationship': relationship ?? "",
        'phone': phone ?? "",
        'password': password ?? "",
        'password_confirmation': password_confirmation ?? "",
        'addedby': addedby ?? "",
      };

      request.fields.addAll(body);
      var response = await request.send();
      return response.statusCode;
    }
  }
}
