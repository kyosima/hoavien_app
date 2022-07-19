import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_history_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHistoryWaittingBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartHistoryWaittingController());
  }
}

class CartHistoryWaittingController extends GetxController {
  final isLoadingDetailWaitOrder = false.obs;
  final detailWaitOrder = CartHistoryDetailModel().data.obs;
  final id = Get.arguments;
  final noteController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailWaitOrder();
  }

  void getDetailWaitOrder() async {
    try {
      isLoadingDetailWaitOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response = await CartService.getCartHistoryDetail(
          userId: userId, id: id.toString());
      detailWaitOrder.value = response?.data;

    } finally {
      isLoadingDetailWaitOrder.value = false;
    }
  }
}
