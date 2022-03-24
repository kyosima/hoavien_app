import 'dart:async';

import 'package:get/get.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) => getTime());
  }

  void getTime() {
    minute.value = DateTime.now().minute;
    hour.value = DateTime.now().hour;
    day.value = DateTime.now().day;
    second.value = DateTime.now().second;
  }
}
