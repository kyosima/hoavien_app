import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';

import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:hoavien_app/service_api/customer/home/second_account/api_add_second_account.dart';
import 'package:hoavien_app/service_api/customer/home/second_account/api_second_account.dart';
import 'package:image_picker/image_picker.dart';

class SecondAccountBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountController());
  }
}

class SecondAccountController extends GetxController {
  final isLoading = true.obs;
  final buttonLoading = false.obs;
  final editButtonLoading = false.obs;
  final ImagePicker _picker = ImagePicker();
  final avatar = "".obs;
  //add secondAccount
  var allSecondAccount = ListSecondAccountModel().data.obs;
  final fullNameController = TextEditingController();
  final relationshipController = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmationController = TextEditingController();
  final phoneController = TextEditingController();
  var obscureTextPassword = false.obs;
  var obscureTextConfirmPassword = false.obs;
  //edit secondAccount
  final avatarEdit = ''.obs;
  final isLoadingButton = false.obs;
  var obsEditPassword = false.obs;
  var obsEditConfirmPassword = false.obs;
  final editFullNameController = TextEditingController();
  final editRelationshipController = TextEditingController();
  final editPhoneController = TextEditingController();
  final editPasswordController = TextEditingController();
  final editConfirmPasswordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    listSecondAccount();
    super.onInit();
  }

  void pickAvatar() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      avatar.value = image.path;
    } else {
      print('Error');
    }
  }

  void pickAvatarEdit() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      avatarEdit.value = image.path;
      print(avatarEdit.value);
    } else {
      print('Error');
    }
  }

  void seePassword() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }

  void seeConfirmPassword() {
    obscureTextConfirmPassword.value = !obscureTextConfirmPassword.value;
  }

  void seeEditPassword() {
    obsEditPassword.value = !obsEditPassword.value;
  }

  void seeEditConfirmPassword() {
    obsEditConfirmPassword.value = !obsEditConfirmPassword.value;
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
    update();
  }

  // delete secondAccount
  void deleteSecondAccout({required String id, required String addedby}) async {
    List<Data>? resuft = [];

    final response =
        await ApiSecondAccount.deleteSecondAccount(id: id, addedby: addedby);
    if (response?.status != null) {
      final listAcc = await ApiSecondAccount.listSecondAccount();
      resuft = listAcc?.data;
      Get.snackbar(
        "X??a t??i kho???n ph??? th??nh c??ng",
        "T??i kho???n ph??? ???? ???????c x??a kh???i danh s??ch",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: const Duration(milliseconds: 600),
      );
    }
    allSecondAccount.value = resuft;
    update();
  }

  // add secondAccount
  void addAccount({
    String? fullname,
    String? relationship,
    String? phone,
    String? password,
    String? password_confirmation,
    String? addedby,
    File? avatar,
  }) async {
    if (avatar != null) {
      buttonLoading.value = true;
      List<Data>? resuft = [];
      var response = await ApiAddSecondAccount.addSecondAccount(
        fullname: fullname,
        relationship: relationship,
        phone: phone,
        password: password,
        password_confirmation: password_confirmation,
        addedby: addedby,
        avatar: avatar,
      );
      if (fullNameController.text.isEmpty ||
          relationshipController.text.isEmpty ||
          phoneController.text.isEmpty ||
          passwordController.text.isEmpty ||
          password_confirmationController.text.isEmpty) {
        buttonLoading.value = false;
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
      } else if (passwordController.text !=
          password_confirmationController.text) {
        buttonLoading.value = false;
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
                '''M???t kh???u x??c nh???n kh??ng ????ng!''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        buttonLoading.value = false;
        if (response == 200) {
          final listAcc = await ApiSecondAccount.listSecondAccount();
          resuft = listAcc?.data;
          Get.snackbar(
            "T???o t??i kho???n ph??? th??nh c??ng",
            "T??i kho???n ph??? ???? ???????c th??m v??o danh s??ch",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 700),
          );

          Future.delayed(const Duration(milliseconds: 1700), () {
            Get.back();
            fullNameController.clear();
            relationshipController.clear();
            phoneController.clear();
            passwordController.clear();
            password_confirmationController.clear();
          });
        } else {
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
                  'S??? ??i???n tho???i ????ng k?? ???? t???n t???i',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ));
          final listAcc = await ApiSecondAccount.listSecondAccount();
          resuft = listAcc?.data;
          update();
        }
      }
      allSecondAccount.value = resuft;
      update();
    } else {
      buttonLoading.value = true;
      List<Data>? resuft = [];
      var response = await ApiAddSecondAccount.addSecondAccount(
        fullname: fullname,
        relationship: relationship,
        phone: phone,
        password: password,
        password_confirmation: password_confirmation,
        addedby: addedby,
      );
      if (fullNameController.text.isEmpty ||
          relationshipController.text.isEmpty ||
          phoneController.text.isEmpty ||
          passwordController.text.isEmpty ||
          password_confirmationController.text.isEmpty) {
        buttonLoading.value = false;
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
      } else if (passwordController.text !=
          password_confirmationController.text) {
        buttonLoading.value = false;
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
                '''M???t kh???u x??c nh???n kh??ng ????ng!''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        buttonLoading.value = false;
        if (response == 200) {
          final listAcc = await ApiSecondAccount.listSecondAccount();
          resuft = listAcc?.data;
          Get.snackbar(
            "T???o t??i kho???n ph??? th??nh c??ng",
            "T??i kho???n ph??? ???? ???????c th??m v??o danh s??ch",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 700),
          );

          Future.delayed(const Duration(milliseconds: 1700), () {
            Get.back();
            fullNameController.clear();
            relationshipController.clear();
            phoneController.clear();
            passwordController.clear();
            password_confirmationController.clear();
          });
        } else {
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
                  'S??? ??i???n tho???i ????ng k?? ???? t???n t???i',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ));
          final listAcc = await ApiSecondAccount.listSecondAccount();
          resuft = listAcc?.data;
          update();
        }
      }
      allSecondAccount.value = resuft;
      update();
    }
  }

  // edit secondAccount
  void editSecondAccount(
      {String? id,
      String? addedby,
      String? phone,
      String? fullname,
      String? relationship,
      String? password,
      String? confirmpassword,
      File? avatar}) async {
    isLoadingButton.value = true;
    List<Data>? resuft = [];
    if (avatar != null) {
      await ApiSecondAccount.editSecondAccount(
        id: id,
        addedby: addedby,
        fullName: fullname,
        relationship: relationship,
        password: password,
        confirmPassword: confirmpassword,
        phone: phone,
        avatar: avatar,
      );
      if (editPhoneController.text.isEmpty ||
          editConfirmPasswordController.text.isEmpty ||
          editFullNameController.text.isEmpty ||
          editRelationshipController.text.isEmpty) {
        isLoadingButton.value = false;
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
                'Vui l??ng ??i???n c??c tr?????ng b???t bu???c!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else if (editPasswordController.text !=
          editConfirmPasswordController.text) {
        isLoadingButton.value = false;
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
                'X??c nh???n m???t kh???u kh??ng ????ng!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        isLoadingButton.value = false;
        var response = await ApiSecondAccount.listSecondAccount();
        resuft = response?.data;
        Get.snackbar(
          "Ch???nh s???a t??i kho???n ph??? th??nh c??ng",
          "Th??ng tin t??i kho???n ph??? ???? ???????c c???p nh???t",
          icon: const Icon(Icons.check_circle, color: Colors.green),
          snackPosition: SnackPosition.TOP,
          colorText: secondaryColor,
          backgroundColor: Colors.white.withOpacity(0.7),
          duration: const Duration(milliseconds: 700),
        );
        Future.delayed(const Duration(milliseconds: 1700), () {
          Get.back();
          editPasswordController.clear();
          editConfirmPasswordController.clear();
        });
      }
    } else {
      await ApiSecondAccount.editSecondAccount(
        id: id,
        addedby: addedby,
        fullName: fullname,
        relationship: relationship,
        password: password,
        confirmPassword: confirmpassword,
        phone: phone,
      );
      if (editPhoneController.text.isEmpty ||
          editConfirmPasswordController.text.isEmpty ||
          editFullNameController.text.isEmpty ||
          editRelationshipController.text.isEmpty) {
        isLoadingButton.value = false;
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
                'Vui l??ng ??i???n c??c tr?????ng b???t bu???c!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else if (editPasswordController.text !=
          editConfirmPasswordController.text) {
        isLoadingButton.value = false;
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
                'X??c nh???n m???t kh???u kh??ng ????ng!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
      } else {
        isLoadingButton.value = false;
        var response = await ApiSecondAccount.listSecondAccount();
        resuft = response?.data;
        Get.snackbar(
          "Ch???nh s???a t??i kho???n ph??? th??nh c??ng",
          "Th??ng tin t??i kho???n ph??? ???? ???????c c???p nh???t",
          icon: const Icon(Icons.check_circle, color: Colors.green),
          snackPosition: SnackPosition.TOP,
          colorText: secondaryColor,
          backgroundColor: Colors.white.withOpacity(0.7),
          duration: const Duration(milliseconds: 700),
        );
        Future.delayed(const Duration(milliseconds: 1700), () {
          Get.back();
          editPasswordController.clear();
          editConfirmPasswordController.clear();
        });
      }
    }

    allSecondAccount.value = resuft;
    update();
  }
}
