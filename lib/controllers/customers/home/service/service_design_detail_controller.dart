import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/service/related_service_model.dart';
import 'package:hoavien_app/models/home/service/service_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';

class ServiceDesignDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ServiceDesignDetailController());
  }
}

class ServiceDesignDetailController extends GetxController {
  final isLoadingService = false.obs;
  final serviceDetail = ServiceDetailModel().data.obs;
  final idService = Get.arguments;
  final isLoadingRelatedService = false.obs;
  final relatedService = RelatedServiceModel().data.obs;
  final rate = 0.0.obs;
  final selectedVariation = 0.obs;
  final price = 0.obs;
  final variationSelect = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailService();
    getRelatedService();
  }

  void getDetailService() async {
    print(idService);
    try {
      isLoadingService.value = true;
      var response = await Service.getDetailService(id: idService.toString());
      serviceDetail.value = response?.data;
      if (serviceDetail.value?.serviceReview != null) {
        var result =
            serviceDetail.value?.serviceReview?.map((m) => m.rating!).average;
        rate.value = result ?? 0.0;
      }
    } finally {
      isLoadingService.value = false;
    }
  }

  void getRelatedService() async {
    try {
      isLoadingRelatedService.value = true;
      var response = await Service.getRelatedService(id: idService.toString());
      relatedService.value = response?.data;
    } finally {
      isLoadingRelatedService.value = false;
    }
  }

  int changeButton(int index) {
    selectedVariation.value = index;
    update();
    return selectedVariation.value;
  }

  void addToCart(
      {String? userId, String? productId, String? variationId}) async {
    var response = await CartService.addToCart(
        userId: userId, productId: productId, variationId: variationId);
    print(response?.message);
    Get.snackbar(
      "Đã thêm sản phẩm vào giỏ hàng",
      "Giỏ hàng đã cập nhật sản phẩm mới",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }
}
