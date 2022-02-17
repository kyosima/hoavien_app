import 'package:get/get.dart';
import 'package:hoavien_app/controllers/saler/home/saler_home_controller.dart';

class SalerDashboardBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SalerDashboardController());
    Get.lazyPut(() => SalerHomeController());
  }
}

class SalerDashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
