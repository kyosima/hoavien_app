import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/taisanso/taisanso_model.dart';
import 'package:http/http.dart' as http;

class TaisansoService {
  static var client = http.Client();
  static Future<TaisansoModel?> getTaisanso() async {
    var response =
        await client.get(Uri.parse('$baseURL/api/digital-asset'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return taisansoModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
