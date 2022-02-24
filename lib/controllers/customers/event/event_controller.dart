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
}
