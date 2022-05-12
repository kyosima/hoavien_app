import 'package:get/get.dart';
import 'package:hoavien_app/models/home/taisanso/area_model.dart';
import 'package:hoavien_app/models/home/taisanso/taisanso_model.dart';
import 'package:hoavien_app/service_api/customer/home/taisanso/taisanso_service.dart';

class TaisansoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoController());
  }
}

class TaisansoController extends GetxController {
  final isLoadingTaisanso = false.obs;
  final allTaisanso = TaisansoModel().data.obs;
  final phanLoaiKhu2 = [].obs;
  final isLoadingArea = false.obs;
  final allArea = AreaModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaisanso();
    getArea();
  }

  void getTaisanso() async {
    try {
      isLoadingTaisanso.value = true;
      var response = await TaisansoService.getTaisanso();
      allTaisanso.value = response?.data;
    } finally {
      isLoadingTaisanso.value = false;
    }
  }

  void getArea() async {
    try {
      isLoadingArea.value = true;
      var response = await TaisansoService.getArea();
      allArea.value = response?.data;
    } finally {
      isLoadingArea.value = false;
    }
  }
}
