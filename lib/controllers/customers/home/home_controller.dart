import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';

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
  final isLoadingProduct = false.obs;
  final allProduct = ProductModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
    getProducts();
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

  void getProducts() async {
    try {
      isLoadingProduct.value = true;
      var response = await ProductService.getProduct();
      allProduct.value = response?.data;
    } finally {
      isLoadingProduct.value = false;
    }
  }
}
