import 'package:get/get.dart';

class SecondAccountMemoryBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountMemoryController());
  }
}

class SecondAccountMemoryController extends GetxController {
}