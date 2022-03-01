import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/second_account/second_account_model.dart';
import 'package:hoavien_app/service/customer/api_add_second_account.dart';
import 'package:intl/intl.dart';

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
  final addedby = TextEditingController();

  void seePassword() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }

  void seeConfirmPassword() {
    obscureTextConfirmPassword.value = !obscureTextConfirmPassword.value;
  }

  Future<SecondAccountModel> addSecondAccount({
    String? fullname,
    String? relationship,
    String? phone,
    String? password,
    String? password_confirmation,
    String? addedby,
  }) async {
    var response = await ApiSecondAccount.addSecondAccount(
      fullname: fullname,
      relationship: relationship,
      phone: phone,
      password: password,
      password_confirmation: password_confirmation,
      addedby: addedby,
    );

    return SecondAccountModel(
      message: response?.message,
      data: response?.data,
      status: response?.status,
    );

    // void addSecondAccount() {
    //   if (fullName.text.isEmpty ||
    //       relationship.text.isEmpty ||
    //       phoneNumber.text.isEmpty ||
    //       passWord.text.isEmpty ||
    //       confirmPassWord.text.isEmpty) {
    //     Get.defaultDialog(
    //         content: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             Container(
    //               height: 60.0,
    //               width: 60,
    //               decoration: const BoxDecoration(
    //                 color: Colors.red,
    //                 shape: BoxShape.circle,
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/error.gif',
    //               width: 55,
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         const Center(
    //           child: Text(
    //             '''Vui lòng điền vào các trường bắt buộc!''',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ));
    //   } else if (passWord.text != confirmPassWord.text) {
    //     Get.defaultDialog(
    //         content: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             Container(
    //               height: 60.0,
    //               width: 60,
    //               decoration: const BoxDecoration(
    //                 color: Colors.red,
    //                 shape: BoxShape.circle,
    //               ),
    //             ),
    //             Image.asset(
    //               'assets/images/error.gif',
    //               width: 55,
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         const Center(
    //           child: Text(
    //             '''Xác nhận mật khẩu không đúng!''',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ));
    //   }
    // }
  }

  void submit() async {
    print(int.parse(addedby.text));
    SecondAccountModel? secondAccount = await addSecondAccount(
        fullname: fullName.text,
        relationship: relationship.text,
        phone: phoneNumber.text,
        password: passWord.text,
        password_confirmation: confirmPassWord.text,
        addedby: addedby.text);
    if (secondAccount.data != null) {
      Get.snackbar(
        "Tạo tài khoản phụ thành công",
        "Tài khoản phụ đã được tạo",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
      );
      Get.toNamed('/secondaccount');
    }
  }
}
