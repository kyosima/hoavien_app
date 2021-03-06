import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/service_api/auth/info_user_service.dart';

class ChangePasswordSalerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangePasswordSalerController());
  }
}

class ChangePasswordSalerController extends GetxController {
  final isLoading = false.obs;
  final passWordController = TextEditingController();
  final newPassWordController = TextEditingController();
  final confirmNewPassWordController = TextEditingController();
  var obsPassWord = true.obs;
  var obsNewPassWord = true.obs;
  var obsConfirmNewPassWord = true.obs;

  void showPassword() {
    obsPassWord.value = !obsPassWord.value;
  }

  void showNewPassword() {
    obsNewPassWord.value = !obsNewPassWord.value;
  }

  void showConfirmNewPassword() {
    obsConfirmNewPassWord.value = !obsConfirmNewPassWord.value;
  }

  void changePassword(
      {String? id,
      String? password,
      String? newPassword,
      String? confirmNewPassword}) async {
    isLoading.value = true;
    var response = await InfoUserService.changePassword(
      id: id,
      password: password,
      newPassword: newPassword,
      confirmNewpassword: confirmNewPassword,
    );
    if (passWordController.text.isEmpty ||
        newPassWordController.text.isEmpty ||
        confirmNewPassWordController.text.isEmpty) {
      isLoading.value = false;
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
              '''C??c tr?????ng b???t bu???c kh??ng ???????c ????? tr???ng!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    } else if (newPassWordController.text !=
        confirmNewPassWordController.text) {
      isLoading.value = false;
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
              '''X??c nh???n m???t kh???u kh??ng ????ng!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    } else {
      if (response?.message == "M???t kh???u c?? kh??ng ch??nh x??c.") {
        isLoading.value = false;
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
                '''M???t kh???u c?? kh??ng ????ng!''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        isLoading.value = false;
        Get.snackbar(
          "?????i m???t kh???u th??nh c??ng",
          "M???t kh???u m???i ???? ???????c c???p nh???t",
          icon: const Icon(Icons.check_circle, color: Colors.green),
          snackPosition: SnackPosition.TOP,
          colorText: secondaryColor,
          backgroundColor: Colors.white.withOpacity(0.7),
          duration: const Duration(milliseconds: 700),
        );
      }
    }
  }
}
