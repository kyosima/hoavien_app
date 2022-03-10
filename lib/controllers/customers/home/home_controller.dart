import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  var productCount = 6.obs;
  final allBanner = BannerModel().data.obs;
  final isLoadingBanner = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
  }

  void readMore() {
    productCount = productCount + 4;
    super.update();
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
