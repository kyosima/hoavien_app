import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/memories/memories_model.dart';
import 'package:http/http.dart' as http;

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
}
