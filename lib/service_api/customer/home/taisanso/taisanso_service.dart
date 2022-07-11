import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/taisanso/area_model.dart';
import 'package:hoavien_app/models/home/taisanso/taisanso_detail_model.dart';
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

  static Future<AreaModel?> getArea() async {
    var response = await client
        .get(Uri.parse('$baseURL/api/digital-asset-area'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return areaModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<TaisansoDetailModel?> getTaisansoDetail({String? id}) async {
    var response = await client
        .get(Uri.parse('$baseURL/api/digital-asset/show?id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return taisansoDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<TaisansoModel?> searchTaisanso(
      {String? key, String? area}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/digital-asset?key=$key&area=$area'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return taisansoModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
