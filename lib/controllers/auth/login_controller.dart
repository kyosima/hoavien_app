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
  var obscureText = true.obs;

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

  void checkpass() {
    obscureText.value = !obscureText.value;
  }

  void check() {
    isChecked.value = !isChecked.value;
  }

  void login() {
    if (phoneNumber.text.isEmpty || passWord.text.isEmpty) {
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
              '''Số điện thoại hoặc password không được để trống!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    } else if (phoneNumber.text == '1' || passWord.text == '1') {
      Get.toNamed('/dashboard');
      Get.snackbar(
        "Đăng nhập thành công",
        "Chúc mừng bạn đã đăng nhập thành công",
        icon: Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
      );
    } else if (phoneNumber.text == '2' || passWord.text == '2') {
      Get.toNamed('/salerdashboard');
      Get.snackbar(
        "Đăng nhập thành công",
        "Chúc mừng bạn đã đăng nhập thành công",
        icon: Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
      );
    }  else if (phoneNumber.text == '3' || passWord.text == '3'){
      Get.toNamed('/secondaccountdashboard');
      Get.snackbar(
      "Đăng nhập thành công",
      "Chúc mừng bạn đã đăng nhập thành công",
      icon: Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      );
    }
  }
}
