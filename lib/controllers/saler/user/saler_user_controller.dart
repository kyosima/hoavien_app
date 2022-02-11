import 'package:get/get.dart';

class SalerUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SalerUserController());
  }
}

class SalerUserController extends GetxController {}
