import 'package:get/get.dart';
import 'package:hoavien_app/models/home/service/service_model.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';

class ServiceBurialBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ServiceBurialController());
  }
}

class ServiceBurialController extends GetxController {
  final isLoading = false.obs;
  final allService = ServiceModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getService();
  }

  void getService() async {
    try {
      isLoading.value = true;
      var response = await Service.getService(id: '2');
      allService.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
