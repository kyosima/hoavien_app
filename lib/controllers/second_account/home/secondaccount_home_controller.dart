import 'package:get/get.dart';

class SecondAccountHomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountHomeController());
  }
}

class SecondAccountHomeController extends GetxController {
  var productCount = 6.obs;

  void readmore() {
    productCount = productCount + 4;
    super.update();
  }
}
