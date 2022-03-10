import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';

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
  final allBanner = BannerModel().data.obs;
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
}
