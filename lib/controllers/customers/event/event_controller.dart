import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/event/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

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
  DateTime focusDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  late final ValueNotifier<List<EventModel>> selectedEvents;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventController.dispose();
  }

  List<EventModel> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) => getTime());
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

final kEvents = LinkedHashMap<DateTime, List<EventModel>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(kEventSource);

final kEventSource = {
  DateTime.utc(kToday.year, kToday.month, kToday.day - 1): [
    EventModel(title: 'Oke', time: '11:12'),
    EventModel(title: 'Oke 1', time: '11:12'),
    EventModel(title: 'Oke 2', time: '11:12'),
  ],
  DateTime.utc(kToday.year, kToday.month, kToday.day): [
    EventModel(title: 'Oke', time: '11:12'),
    EventModel(title: 'Oke 1', time: '11:12'),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
