import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var loginProcess = false.obs;

  Future<UserModel?> login({String? phone, String? password}) async {
    var response =
        await ApiService.login(phoneNumber: phone, passWord: password);
    return UserModel(
      message: response?.message,
      data: response?.data,
      status: response?.status,
    );
  }

  void checkpass() {
    obscureText.value = !obscureText.value;
  }

  void check() {
    isChecked.value = !isChecked.value;
  }

  Future<void> submit() async {
    final prefs = await SharedPreferences.getInstance();
    loginProcess.value = true;
    if (passWord.text.isEmpty || phoneNumber.text.isEmpty) {
      loginProcess.value = false;
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
    } else {
      UserModel? user =
          await login(phone: phoneNumber.text, password: passWord.text);
      if (user?.data != null) {
        loginProcess.value = false;
        if (user?.data?.role == 'customer') {
          Get.toNamed('/dashboard', arguments: user);
          Get.snackbar(
            "Đăng nhập thành công",
            "Chúc mừng bạn đã đăng nhập thành công",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        } else if (user?.data?.role == 'sale') {
          Get.toNamed('/salerdashboard', arguments: user);
          Get.snackbar(
            "Đăng nhập thành công",
            "Chúc mừng bạn đã đăng nhập thành công",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        }
      } else {
        loginProcess.value = false;
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
                '''Số điện thoại hoặc mật khẩu không đúng''',
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
