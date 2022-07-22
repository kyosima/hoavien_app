import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/area/area_detail_model.dart';
import 'package:hoavien_app/models/area/taisanso_quickview_model.dart';
import 'package:http/http.dart' as http;

class AreaService {
  static var client = http.Client();
  static Future<AreaDetailModel?> getAreaDetail({String? id}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/digital-asset-area/show?id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return areaDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<TaisansoQuickviewModel?> getTaisansoQuickview(
      {String? id}) async {
    var response = await client.get(
        Uri.parse('$baseURL/api/digital-asset/show-quickly?id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return taisansoQuickviewModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
