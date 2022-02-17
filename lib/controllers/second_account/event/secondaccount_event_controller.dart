import 'package:get/get.dart';

class SecondAccountEventBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountEventController() );
  }
  
}

class SecondAccountEventController extends GetxController {

}