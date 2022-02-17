import 'package:get/get.dart';

class SalerHomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SalerHomeController());
  }
}

class SalerHomeController extends GetxController {
  final productCount = 4.obs;
  final bdsCount = 6.obs;
  void viewMore() {
    productCount.value = productCount.value + 4;
  }

  void viewMoreBds() {
    bdsCount.value = bdsCount.value + 4;
  }
}
