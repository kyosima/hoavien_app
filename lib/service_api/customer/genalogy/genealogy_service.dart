import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/genealogy/list_genalogy_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GenealogyService {
  static final client = http.Client();
  static Future<ListGenealogyModel?> ListGenealogy() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    var response = await client
        .get(Uri.parse('$baseURL/api/family-annal?user_id=3'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return ListGenealogyModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
