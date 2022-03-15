import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';

class SecondAccountHomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountHomeController());
  }
}

class SecondAccountHomeController extends GetxController {
  var productCount = 6.obs;
  final isLoadingBanner = false.obs;
  final isLoadingProduct = false.obs;
  final allBanner = BannerModel().data.obs;
  final allProduct = ProductModel().data.obs;

  void readmore() {
    productCount = productCount + 4;
    super.update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
    getProduct();
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

  void getProduct() async {
    try {
      isLoadingProduct.value = true;
      var response = await ProductService.getProduct();
      allProduct.value = response?.data;
    } finally {
      isLoadingProduct.value = false;
    }
  }
}
