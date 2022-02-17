import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddSecondAccountBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddSecondAccountController());
  }
}

class AddSecondAccountController extends GetxController {
  var obscureTextPassword = false.obs;
  var obscureTextConfirmPassword = false.obs;
  final fullName = TextEditingController();
  final relationship = TextEditingController();
  final phoneNumber = TextEditingController();
  final passWord = TextEditingController();
  final confirmPassWord = TextEditingController();

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

  void seePassword() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }

  void seeConfirmPassword() {
    obscureTextConfirmPassword.value = !obscureTextConfirmPassword.value;
  }

  void addSecondAccount() {
    if (fullName.text.isEmpty ||
        relationship.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        passWord.text.isEmpty ||
        confirmPassWord.text.isEmpty) {
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
              '''Vui lòng điền vào các trường bắt buộc!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    } else if (passWord.text != confirmPassWord.text) {
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
              '''Xác nhận mật khẩu không đúng!''',
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
