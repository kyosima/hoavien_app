import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/event/event_model.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EventController());
  }
}

class EventController extends GetxController {
  final hour = DateTime.now().hour.obs;
  final minute = DateTime.now().minute.obs;
  final second = DateTime.now().second.obs;
  final day = DateTime.now().day.obs;
  Map<DateTime, List<EventModel>>? selectedEvent;
  final eventController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) => getTime());
    selectedEvent = {};
  }

  List<EventModel> getEventFromDate(DateTime date) {
    return selectedEvent![date] ?? [];
  }

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

  void getTime() {
    minute.value = DateTime.now().minute;
    hour.value = DateTime.now().hour;
    day.value = DateTime.now().day;
    second.value = DateTime.now().second;
  }
}
