import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_history_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHistoryDetailDoneOrderBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartHistoryDetailDoneOrderController());
  }
}

class CartHistoryDetailDoneOrderController extends GetxController {
  final isLoading = false.obs;
  final orderDetail = CartHistoryDetailModel().data.obs;
  final id = Get.arguments.toString();
  final noteController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDoneOrderDetail();
  }

  void getDoneOrderDetail() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistoryDetail(id: id, userId: userId);
      orderDetail.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
