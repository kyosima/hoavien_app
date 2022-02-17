import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticalBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StatisticalController());
  }
}

class StatisticalController extends GetxController {
  final pickStartDateController = TextEditingController();
  final pickEndDateController = TextEditingController();
  final monthController = TextEditingController();

  void pickStartDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    pickStartDateController.text = date.toString().substring(0, 10);
  }

  void pickEndDate() async {
    var date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    pickEndDateController.text = date.toString().substring(0, 10);
  }
}
