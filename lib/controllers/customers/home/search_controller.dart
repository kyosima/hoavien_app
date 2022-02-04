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
  var isCheckedAll = false.obs;
  var isCheckedService = false.obs;
  var isCheckedItem = false.obs;
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

  void checkboxAll() {
    isCheckedAll.value = !isCheckedAll.value;
    if (isCheckedAll.value = true) {
      isCheckedService.value = true;
      isCheckedItem.value = true;
    } else {}
  }

  void checkboxService() {
    isCheckedService.value = !isCheckedService.value;
  }

  void checkboxItem() {
    isCheckedItem.value = !isCheckedItem.value;
  }
}
