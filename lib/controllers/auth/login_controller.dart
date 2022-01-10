import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  final passWord = TextEditingController();
  var isChecked = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void check() {
    isChecked.value = !isChecked.value;
  }

  void login() {
    if (phoneNumber.text.isEmpty || passWord.text.isEmpty) {
      Get.defaultDialog(
        title: "Phát hiện lỗi",
        middleText: "Số điện thoại hoặc password không được để trống!",
        backgroundColor: Colors.grey[200],
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      Get.snackbar(
        "Đăng nhập thành công",
        "Chúc mừng bạn đã đăng nhập thành công",
        icon: Icon(Icons.check_circle, color: primaryColor),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
