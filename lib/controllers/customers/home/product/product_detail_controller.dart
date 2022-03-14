import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductDetailController());
  }
}

class ProductDetailController extends GetxController {
  final isLoadingProduct = false.obs;
  final idController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductDetail();
  }

  void getProductDetail() async {
    try {
      isLoadingProduct.value = true;
      var response =
          await ProductService.getProductDetails(id: idController.text);
      print(response?.message);
      print(idController.text);
    } finally {
      isLoadingProduct.value = false;
    }
  }
}
