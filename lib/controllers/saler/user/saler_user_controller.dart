import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/info_user_model.dart';
import 'package:hoavien_app/service_api/auth/info_user_service.dart';

class SalerUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SalerUserController());
  }
}

class SalerUserController extends GetxController {
  var loadingUser = true.obs;
  final infoUser = InfoUserModel().data.obs;
  // infoUser
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final sexMenuController = TextEditingController();
  final isLoading = false.obs;
  final loadingButton = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfoUser();
  }

  void getInfoUser() async {
    try {
      loadingUser.value = true;
      var response = await InfoUserService.infoUser();
      infoUser.value = response?.data;
      update();
    } finally {
      loadingUser.value = false;
    }
    update();
  }

  void setDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
  }

  void updateInfo(
      {String? id, String? fullname, String? gender, String? birthday}) async {
    loadingButton.value = true;
    await InfoUserService.updateInfoUser(
      id: id,
      gender: gender,
      fullname: fullname,
      birthday: birthday,
    );
    var response = await InfoUserService.infoUser();
    infoUser.value = response?.data;
    update();
    Get.snackbar(
      "Cập nhật thông tin thành công",
      "Thông tin cá nhân đã được cập nhật",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 700),
    );
    fullNameController.clear();
    loadingButton.value = false;
  }
}
