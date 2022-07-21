import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/service/combo_detail_model.dart';
import 'package:hoavien_app/models/home/service/combo_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';

class SecondAccountComboDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountComboDetailController());
  }
}

class SecondAccountComboDetailController extends GetxController {
  final isLoadingCombo = false.obs;
  final comboDetail = ComboDetailModel().data.obs;
  final idCombo = Get.arguments;
  final rate = 0.0.obs;
  final isLoadingRelatedCombo = false.obs;
  final relatedCombo = ComboModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getComboDetail();
    getRelatedCombo();
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

  void getComboDetail() async {
    try {
      isLoadingCombo.value = true;
      var response = await ComboService.getComboDetail(id: idCombo.toString());
      comboDetail.value = response?.data;
      if (comboDetail.value?.comboReview != null) {
        var result =
            comboDetail.value?.comboReview?.map((m) => m.rating!).average;
        rate.value = result ?? 0.0;
      }
    } finally {
      isLoadingCombo.value = false;
    }
  }

  void getRelatedCombo() async {
    try {
      isLoadingRelatedCombo.value = true;
      var response = await ComboService.getRelatedCombo(id: idCombo.toString());
      relatedCombo.value = response?.data;
    } finally {
      isLoadingRelatedCombo.value = false;
    }
  }
}
