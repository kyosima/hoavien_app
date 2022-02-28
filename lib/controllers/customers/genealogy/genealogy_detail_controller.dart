import 'package:get/get.dart';

class GenealoryDetailBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GenealoryDetailController());
  }
}

class GenealoryDetailController extends GetxController {}
