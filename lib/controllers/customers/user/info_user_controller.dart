import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InfoUserController());
  }
}

class InfoUserController extends GetxController {
  final dateController = TextEditingController();
  final sexController = TextEditingController();
  final sexMenuController = new TextEditingController();

  void setDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
  }
}
