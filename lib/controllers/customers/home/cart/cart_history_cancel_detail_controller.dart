import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_history_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHistoryCancelDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartHistoryCancelDetailController());
  }
}

class CartHistoryCancelDetailController extends GetxController {
  final isLoading = false.obs;
  final id = Get.arguments.toString();
  final orderDetail = CartHistoryDetailModel().data.obs;
  final noteController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCancelDetail();
  }

  void getCancelDetail() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistoryDetail(userId: userId, id: id);
      orderDetail.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
