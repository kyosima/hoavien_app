import 'package:get/get.dart';

class TaisansoDetailBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoDetailController());
  }
}

class TaisansoDetailController extends GetxController {}
