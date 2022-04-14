import 'package:get/get.dart';
import 'package:hoavien_app/models/home/taisanso/taisanso_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/taisanso/taisanso_service.dart';

class TaisansoDetailBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoDetailController());
  }
}

class TaisansoDetailController extends GetxController {
  final isLoading = false.obs;
  final id = Get.arguments.toString();
  final taisansoDetails = TaisansoDetailModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaisansoDetail();
  }

  void getTaisansoDetail() async {
    try {
      isLoading.value = true;
      var response = await TaisansoService.getTaisansoDetail(id: id);
      taisansoDetails.value = response?.data;
      print(id);
    } finally {
      isLoading.value = false;
    }
  }
}
