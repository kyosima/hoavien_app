import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ForgetPasswordController());
  }
}

class ForgetPasswordController extends GetxController {
  final phoneNumber = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void forgetpassword() {
    if (phoneNumber.text.isEmpty) {
      Get.defaultDialog(
        title: "Phát hiện lỗi",
        middleText: "Số điện thoại không được để trống!",
        backgroundColor: Colors.grey[200],
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      Get.toNamed('/otp');
    }
  }
}
