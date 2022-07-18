import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_taisanso_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CheckoutDetailController());
  }
}

class CheckoutDetailController extends GetxController {
  final dateTimeController = TextEditingController();
  final noteController = TextEditingController();
  final dateTime = DateTime.now();
  final fullName = ''.obs;
  final phone = ''.obs;
  final isLoadingTaisanso = false.obs;
  final cartTaisanso = CartTaisansoModel().data.obs;
  final taisansoSelectName = ''.obs;
  final productsId = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
    getCartTaisanso();
  }

  void setDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateTimeController.text = date.toString().substring(0, 10);
  }

  void getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    fullName.value = prefs.getString('fullName') ?? '';
    phone.value = prefs.getString('phoneNumber') ?? '';
  }

  void getCartTaisanso() async {
    try {
      isLoadingTaisanso.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response = await CartService.getCartTaisanso(userId: userId);
      cartTaisanso.value = response?.data;
    } finally {
      isLoadingTaisanso.value = false;
    }
  }
}
