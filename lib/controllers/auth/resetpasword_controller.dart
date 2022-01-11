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
          content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60.0,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(
                'assets/images/error.gif',
                width: 55,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Mật khẩu không được để trống!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    } else {
      if (passWordController.text.length <= 5) {
        Get.defaultDialog(
            content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 60.0,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  'assets/images/error.gif',
                  width: 55,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Mật khẩu phải ít nhất 5 ký tự!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
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
              content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60.0,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(
                    'assets/images/error.gif',
                    width: 55,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Xác nhận mật khẩu không đúng!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ));
        }
      }
    }
  }
}
