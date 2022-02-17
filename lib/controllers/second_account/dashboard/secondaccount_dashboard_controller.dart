import 'package:get/get.dart';
import 'package:hoavien_app/controllers/second_account/home/secondaccount_home_controller.dart';

class SecondAccountDashboardBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountDashboardController());
    Get.lazyPut(() => SecondAccountHomeController());
  }
}

class SecondAccountDashboardController extends GetxController{
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

}