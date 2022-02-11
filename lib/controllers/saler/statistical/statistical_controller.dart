import 'package:get/get.dart';

class StatisticalBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StatisticalController());
  }
}

class StatisticalController extends GetxController {}
