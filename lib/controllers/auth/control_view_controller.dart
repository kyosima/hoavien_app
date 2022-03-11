import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ControlViewController());
  }
}

class ControlViewController extends GetxController {
  final userRole = "".obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserRole();
  }

  void getUserRole() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      userRole.value = prefs.getString('userRole') ?? "";
      update();
    } finally {
      isLoading.value = false;
    }
  }
}
