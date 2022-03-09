import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:http/http.dart' as http;

class ApiBanner {
  static final client = http.Client();
  static Future<BannerModel?> getBanner() async {
    var response =
        await client.get(Uri.parse('$baseURL/api/list-banner'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return bannerModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
