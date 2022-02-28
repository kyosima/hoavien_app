import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  var unit = 0.obs;

  void plus() {
    unit = unit++;
    super.update();
  }

  void minus() {
    unit = unit--;
    super.update();
  }
}
