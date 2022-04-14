import 'dart:io';

import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/status_model.dart';
import 'package:hoavien_app/models/memories/memories_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

class MemoriesService {
  static var client = http.Client();
  static Future<MemoriesModel?> getImage({
    String? id,
  }) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/user-gallery?user_id=$id&type=image'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return memoriesModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<MemoriesModel?> getVideo({String? id}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/user-gallery?user_id=$id&type=video'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return memoriesModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<int?> createImage({String? id, File? image}) async {
    var stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
    var length = await image.length();
    var request = http.MultipartRequest(
        "POST", Uri.parse('$baseURL/api/user-gallery/create'));
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(image.path));
    var body = {
      'user_id': id ?? '',
      'type': 'image',
    };
    request.files.add(multipartFile);
    request.fields.addAll(body);
    var response = await request.send();
    return response.statusCode;
  }

  static Future<StatusModel?> deleteImage({String? id, String? idUser}) async {
    var response = await client.delete(
        Uri.parse('$baseURL/api/user-gallery/delete'),
        body: {'id': id, 'user_id': idUser});
    if (response.statusCode == 200) {
      return statusModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<int?> createVideo({String? id, File? video}) async {
    var stream = http.ByteStream(DelegatingStream.typed(video!.openRead()));
    var length = await video.length();
    var request = http.MultipartRequest(
        "POST", Uri.parse('$baseURL/api/user-gallery/create'));
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(video.path));
    var body = {
      'user_id': id ?? '',
      'type': 'video',
    };
    request.files.add(multipartFile);
    request.fields.addAll(body);
    var response = await request.send();
    return response.statusCode;
  }
}
