import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';

import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:hoavien_app/service/customer/home/second_account/api_add_second_account.dart';
import 'package:hoavien_app/service/customer/home/second_account/api_second_account.dart';

class SecondAccountBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountController());
  }
}

class SecondAccountController extends GetxController {
  final isLoading = true.obs;
  var allSecondAccount = ListSecondAccountModel().data.obs;
  final fullNameController = TextEditingController();
  final relationshipController = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmationController = TextEditingController();
  final phoneController = TextEditingController();
  var obscureTextPassword = false.obs;
  var obscureTextConfirmPassword = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    listSecondAccount();
    super.onInit();
  }

  void seePassword() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }

  void seeConfirmPassword() {
    obscureTextConfirmPassword.value = !obscureTextConfirmPassword.value;
  }

  void listSecondAccount() async {
    final secondAccount = await ApiSecondAccount.listSecondAccount();
    try {
      isLoading.value = true;
      if (secondAccount != null) {
        allSecondAccount.value = secondAccount.data;
      } else {
        print('error');
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }

  void findSecondAccount(String phone) async {
    List<Data>? resuft = [];
    final secondAccount = await ApiSecondAccount.listSecondAccount();
    if (phone.isEmpty) {
      resuft = secondAccount?.data;
    } else {
      resuft = secondAccount?.data
          ?.where((element) => (element.phone)
              .toString()
              .toLowerCase()
              .contains(phone.toLowerCase()))
          .toList();
    }
    allSecondAccount.value = resuft;
    print(allSecondAccount.value?.length);
    update();
  }

  void deleteSecondAccout({required String id, required String addedby}) async {
    List<Data>? resuft = [];

    final response =
        await ApiSecondAccount.deleteSecondAccount(id: id, addedby: addedby);
    if (response?.status != null) {
      final listAcc = await ApiSecondAccount.listSecondAccount();
      resuft = listAcc?.data;
      Get.snackbar(
        "Xóa tài khoản phụ thành công",
        "Tài khoản phụ đã được xóa khỏi danh sách",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: Duration(milliseconds: 1000),
      );
    }
    allSecondAccount.value = resuft;
    update();
  }

  void addAccount({
    String? fullname,
    String? relationship,
    String? phone,
    String? password,
    String? password_confirmation,
    String? addedby,
  }) async {
    List<Data>? resuft = [];
    var response = await ApiAddSecondAccount.addSecondAccount(
      fullname: fullname,
      relationship: relationship,
      phone: phone,
      password: password,
      password_confirmation: password_confirmation,
      addedby: addedby,
    );
    if (response?.data != null) {
      final listAcc = await ApiSecondAccount.listSecondAccount();
      resuft = listAcc?.data;
      Get.snackbar(
        "Tạo tài khoản phụ thành công",
        "Tài khoản phụ đã được thêm vào danh sách",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: Duration(milliseconds: 700),
      );
      Future.delayed(Duration(milliseconds: 1700), () {
        Get.back();
      });
    } else {
      print('cac');
    }
    allSecondAccount.value = resuft;
    update();
  }
}
