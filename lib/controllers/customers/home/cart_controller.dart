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
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void plus() {
    unit = unit++;
    super.update();
  }

  void minus() {
    unit = unit--;
    super.update();
  }
}
