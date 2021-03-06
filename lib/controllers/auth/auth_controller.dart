import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/service_api/auth/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constance.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

class AuthController extends GetxController {
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
              '''S??? ??i???n tho???i ho???c password kh??ng ???????c ????? tr???ng!''',
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
      final data = user?.data;
      if (data != null) {
        await prefs.setInt('id', data.id ?? 0);
        await prefs.setString('phoneNumber', data.phone ?? '');
        await prefs.setString('fullName', data.userInfo?.fullname ?? '');
        loginProcess.value = false;
        if (data.role == 'customer') {
          await prefs.setString('userRole', data.role ?? "");
          Get.offNamed('/dashboard', arguments: user);
          Get.snackbar(
            "????ng nh???p th??nh c??ng",
            "Ch??c m???ng b???n ???? ????ng nh???p th??nh c??ng",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        } else if (data.role == 'sale') {
          await prefs.setString('userRole', data.role ?? "");
          Get.offNamed('/salerdashboard', arguments: user);
          Get.snackbar(
            "????ng nh???p th??nh c??ng",
            "Ch??c m???ng b???n ???? ????ng nh???p th??nh c??ng",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
          );
        } else if (data.role == 'customer-secondary') {
          await prefs.setString('userRole', data.role ?? "");
          Get.offNamed('/secondaccountdashboard');
          Get.snackbar(
            "????ng nh???p th??nh c??ng",
            "Ch??c m???ng b???n ???? ????ng nh???p th??nh c??ng",
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
                '''S??? ??i???n tho???i ho???c m???t kh???u kh??ng ????ng''',
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

  Future<void> logOut() async {
    final preps = await SharedPreferences.getInstance();
    await preps.remove('id');
    await preps.remove('phoneNumber');
    await preps.remove('fullName');
    await preps.remove('userRole');
    Get.offAllNamed('/login');
    Get.deleteAll();
    phoneNumber.clear();
    passWord.clear();
  }
}
