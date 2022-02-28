import 'package:get/get.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserController());
  }
}

class UserController extends GetxController {
  var loadingUser = true.obs;
}
