import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/control_view_controller.dart';
import 'package:hoavien_app/controllers/customers/home/home_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ControlViewController());
  }
}

class DashBoardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
