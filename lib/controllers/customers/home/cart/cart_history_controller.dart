import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/cart/cart_history_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartHistoryController());
  }
}

class CartHistoryController extends GetxController {
  final isLoadingWaitOrder = false.obs;
  final isLoadingDoneOrder = false.obs;
  final isLoadingCancelOrder = false.obs;
  final waitOrder = CartHistoryModel().data.obs;
  final doneOrder = CartHistoryModel().data.obs;
  final cancelOrderCart = CartHistoryModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWaitingOder();
    getDoneOder();
    getCancelOrder();
  }

  void getWaitingOder() async {
    try {
      isLoadingWaitOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistory(userId: userId, status: '0');
      waitOrder.value = response?.data;
    } finally {
      isLoadingWaitOrder.value = false;
    }
  }

  void getDoneOder() async {
    try {
      isLoadingDoneOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistory(userId: userId, status: '1');
      doneOrder.value = response?.data;
    } finally {
      isLoadingDoneOrder.value = false;
    }
  }

  void getCancelOrder() async {
    try {
      isLoadingCancelOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistory(userId: userId, status: '2');
      cancelOrderCart.value = response?.data;
    } finally {
      isLoadingCancelOrder.value = false;
    }
  }

  void cancelOrder({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id').toString();
    await CartService.changeOrderStatus(id: id, userId: userId, status: '2');
    var response =
        await CartService.getCartHistory(userId: userId, status: '0');
    var response1 =
        await CartService.getCartHistory(userId: userId, status: '2');
    waitOrder.value = response?.data;
    cancelOrderCart.value = response1?.data;
    Get.snackbar(
      "Đã hủy đơn hàng",
      "Lịch sử mua hàng đã được cập nhật!",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }

  void reOrder({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id').toString();
    await CartService.changeOrderStatus(id: id, userId: userId, status: '0');
    var response =
        await CartService.getCartHistory(userId: userId, status: '0');
    var response1 =
        await CartService.getCartHistory(userId: userId, status: '2');
    waitOrder.value = response?.data;
    cancelOrderCart.value = response1?.data;
    Get.snackbar(
      "Đã đặt lại đơn hàng",
      "Lịch sử mua hàng đã được cập nhật!",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }
}
