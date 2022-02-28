import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangePasswordUserController());
  }
}

class ChangePasswordUserController extends GetxController {
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
}
