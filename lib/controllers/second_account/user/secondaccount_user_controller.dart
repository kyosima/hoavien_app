import 'package:get/get.dart';

class SecondAccountUserBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountUserController());
  }
}

class SecondAccountUserController extends GetxController {
}