import 'package:get/get.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TransactionController());
  }
}

class TransactionController extends GetxController {}
