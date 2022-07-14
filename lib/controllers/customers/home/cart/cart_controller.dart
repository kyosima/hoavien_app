import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  var unit = 0.obs;
  final isLoadingCart = false.obs;
  final cartInfo = CartModel().data.obs;
  final totalPrice = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartInfo();
  }

  void getCartInfo() async {
    try {
      isLoadingCart.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response = await CartService.getCartInfo(userId: userId);
      cartInfo.value = response?.data;
    } finally {
      isLoadingCart.value = false;
    }
  }

  void deleteProductCart({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getInt('id').toString();
    await CartService.deleteProductCart(id: id, userId: userID);
    var response = await CartService.getCartInfo(userId: userID);
    cartInfo.value = response?.data;
    Get.snackbar(
      "Đã cập xóa sản phẩm thành công",
      "Giỏ hàng đã cập nhật!",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }

  void updateProductcart({String? id, String? userId, String? quantity}) async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getInt('id').toString();
    await CartService.updateProductCart(
        id: id, userId: userID, quantity: quantity);
    var response = await CartService.getCartInfo(userId: userID);
    cartInfo.value = response?.data;
    Get.snackbar(
      "Đã cập nhật giỏ hàng",
      "Giỏ hàng đã cập nhật sản phẩm",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 900),
    );
  }
}
