import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchController());
  }
}

class SearchController extends GetxController {
  var isChecked = false.obs;
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

  void checkbox() {
    isChecked.value = !isChecked.value;
  }
}
