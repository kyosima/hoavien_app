import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}

class ResetPasswordController extends GetxController {
  final passWordController = TextEditingController();
  final newPassWordController = TextEditingController();

  @override
  void onClose() {
    passWordController.dispose();
    newPassWordController.dispose();
    super.onClose();
  }

  void resetpassword() {
    if (passWordController.text.isEmpty || newPassWordController.text.isEmpty) {
      Get.defaultDialog(
        title: "Phát hiện lỗi",
        middleText: "Password không được để trống!",
        backgroundColor: Colors.grey[200],
        titleStyle: TextStyle(color: Colors.red),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    } else {
      if (passWordController.text.length <= 5) {
        Get.defaultDialog(
          title: "Phát hiện lỗi",
          middleText: "Xác nhận không được dưới 5 ký tự!",
          backgroundColor: Colors.grey[200],
          titleStyle: TextStyle(color: Colors.red),
          middleTextStyle: TextStyle(color: Colors.black),
        );
      } else {
        if (passWordController.text == newPassWordController.text) {
          Get.snackbar('Bạn đã đổi mật khẩu thành công!', 'Vui lòng đăng nhập',
              icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ));
          Get.toNamed('/login');
        } else {
          Get.defaultDialog(
            title: "Phát hiện lỗi",
            middleText: "Xác nhận mật khẩu không đúng!",
            backgroundColor: Colors.grey[200],
            titleStyle: TextStyle(color: Colors.red),
            middleTextStyle: TextStyle(color: Colors.black),
          );
        }
      }
    }
  }
}
