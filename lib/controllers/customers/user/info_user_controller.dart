import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/auth/info_user_model.dart';
import 'package:hoavien_app/service_api/auth/info_user_service.dart';

class InfoUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InfoUserController());
  }
}

class InfoUserController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final sexMenuController = TextEditingController();
  var informationUser = InfoUserModel().data.obs;
  final isLoading = false.obs;
  final loadingButton = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfoUser();
  }

  void setDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
  }

  void getInfoUser() async {
    try {
      isLoading.value = true;
      var response = await InfoUserService.infoUser();
      print(response?.message);
      if (response?.data != null) {
        informationUser.value = response?.data;
        update();
      } else {
        print('cac');
        return null;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void updateInfo(
      {String? id, String? fullname, String? gender, String? birthday}) async {
    var response = await InfoUserService.updateInfoUser(
      id: id,
      gender: gender,
      fullname: fullname,
      birthday: birthday,
    );
    Get.snackbar(
      "Cập nhật thông tin thành công",
      "Thông tin cá nhân đã được cập nhật",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 700),
    );
  }
}
