import 'package:get/get.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void seePassword() {
    obscureTextPassword.value = !obscureTextPassword.value;
  }

  void seeConfirmPassword() {
    obscureTextConfirmPassword.value = !obscureTextConfirmPassword.value;
  }
}
