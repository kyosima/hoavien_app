import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BdsDetailsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BdsDetailsController());
  }
}

class BdsDetailsController extends GetxController {
  final showTable = false.obs;
  final arenaController = TextEditingController();

  void showTableDetail() {
    showTable.value = !showTable.value;
  }
}
