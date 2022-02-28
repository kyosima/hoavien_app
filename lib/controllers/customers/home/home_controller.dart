import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  var productCount = 6.obs;

  void readmore() {
    productCount = productCount + 4;
    super.update();
  }
}
