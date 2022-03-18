import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/service/combo_detail_model.dart';
import 'package:hoavien_app/models/home/service/combo_model.dart';
import 'package:hoavien_app/models/home/service/service_model.dart';
import 'package:http/http.dart' as http;

class ComboService {
  static var client = http.Client();
  static Future<ComboModel?> getCombo() async {
    var response = await client.get(Uri.parse('$baseURL/api/list-combo'),
        headers: {'X-TOKEN-ACCESS': tokenAccess});
    if (response.statusCode == 200) {
      return comboModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ComboDetailModel?> getComboDetail({String? id}) async {
    var response = await client
        .get(Uri.parse('$baseURL/api/show-combo?combo_id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return comboDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ComboModel?> getRelatedCombo({String? id}) async {
    var response = await client
        .get(Uri.parse('$baseURL/api/related-combo?combo_id=$id'), headers: {
      'X-TOKEN-ACCESS': tokenAccess,
    });
    if (response.statusCode == 200) {
      return comboModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

class Service {
  static var client = http.Client();
  static Future<ServiceModel?> getService({String? id}) async {
    var response = await client.get(
        Uri.parse(
            '$baseURL/api/list-service-follow-category?service_category_id=$id'),
        headers: {
          'X-TOKEN-ACCESS': tokenAccess,
        });
    if (response.statusCode == 200) {
      return serviceModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
