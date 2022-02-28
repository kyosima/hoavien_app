import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEventBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CreateEventController());
  }
}

class CreateEventController extends GetxController {
  final nameEventController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  void setEventDay() async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
  }

  void setEventTime() async {
    var time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    timeController.text = time!.hour.toString() + ":" + time.minute.toString();
  }
}
