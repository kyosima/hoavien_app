import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/login_model.dart';
import 'package:hoavien_app/service/api_service.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<LoginModel?> login({String? phone, String? password}) async {
    loginProcess.value = true;
    var response =
        await ApiService.login(phoneNumber: phone, passWord: password);

    if (phoneNumber.text.isEmpty || passWord.text.isEmpty) {
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
      if (response?.status == 200) {
        loginProcess.value = false;
        if (response?.data?.role == 'customer') {
          Get.toNamed('/dashboard');
          Get.snackbar(
            "Đăng nhập thành công",
            "Chúc mừng bạn đã đăng nhập thành công",
            icon: Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        } else if (response?.data?.role == 'sale') {
          Get.toNamed('/salerdashboard');
          Get.snackbar(
            "Đăng nhập thành công",
            "Chúc mừng bạn đã đăng nhập thành công",
            icon: Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        } else if (response?.message == "Đăng nhập không thành công") {
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
        return response;
      }
    }
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
}
