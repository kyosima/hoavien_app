import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/models/home/taisanso/area_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';
import 'package:hoavien_app/service_api/customer/home/taisanso/taisanso_service.dart';

class SalerHomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SalerHomeController());
  }
}

class SalerHomeController extends GetxController {
  final productCount = 4.obs;
  final bdsCount = 6.obs;
  final isLoadingBanner = false.obs;
  final isLoadingArea = false.obs;
  final allBanner = BannerModel().data.obs;
  final allArea = AreaModel().data.obs;
  void viewMore() {
    productCount.value = productCount.value + 4;
  }

  void viewMoreBds() {
    bdsCount.value = bdsCount.value + 4;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
    getArea();
  }

  void getBanner() async {
    try {
      isLoadingBanner.value = true;
      var response = await ApiBanner.getBanner();
      allBanner.value = response?.data;
      update();
    } finally {
      isLoadingBanner.value = false;
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
