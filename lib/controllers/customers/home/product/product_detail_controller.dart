import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/product/product_detail_model.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final id = Get.arguments;
  final price = 0.obs;
  final variationSelect = 0.obs;
  final selectedVariation = 0.obs;
  final product = ProductDetailModel().data.obs;
  final relatedProduct = ProductModel().data.obs;
  RxDouble rate = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductDetail();
  }

  void getProductDetail() async {
    try {
      isLoadingProduct.value = true;
      var response = await ProductService.getProductDetails(id: id.toString());
      var resuft = await ProductService.getRelatedProduct(id: id.toString());
      product.value = response?.data;
      relatedProduct.value = resuft?.data;
      if (product.value?.productReview != null) {
        var result =
            product.value?.productReview?.map((m) => m.rating!).average;
        rate.value = result ?? 0.0;
      }
    } finally {
      isLoadingProduct.value = false;
    }
  }

  void rateProduct({String? idProduct, String? idUser, String? rate}) async {
    final prefs = await SharedPreferences.getInstance();
    await ProductService.rateProduct(
      idProduct: id.toString(),
      idUser: prefs.getInt('id').toString(),
      rate: rate,
    );
    Get.snackbar(
      "???? ????nh gi?? s???n ph???m",
      "C???m ??n b???n ???? ????nh gi?? s???n ph???m",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 700),
    );
  }

  int changeButton(int index) {
    selectedVariation.value = index;
    update();
    return selectedVariation.value;
  }

  void addToCart(
      {String? userId, String? productId, String? variationId}) async {
    await CartService.addToCart();
    var response = await CartService.addToCart(
        userId: userId, productId: productId, variationId: variationId);
    print(response?.message);
    Get.snackbar(
      "???? th??m s???n ph???m v??o gi??? h??ng",
      "Gi??? h??ng ???? c???p nh???t s???n ph???m m???i",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }
}
