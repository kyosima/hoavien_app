import 'package:get/get.dart';
import 'package:hoavien_app/models/home/service/combo_model.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';

class ComboHotBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ConboHotController());
  }
}

class ConboHotController extends GetxController {
  final isLoadingCombo = false.obs;
  final allCombo = ComboModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCombo();
  }

  void getCombo() async {
    try {
      isLoadingCombo.value = true;
      var response = await ComboService.getCombo();
      allCombo.value = response?.data;
    } finally {
      isLoadingCombo.value = false;
    }
  }
}
