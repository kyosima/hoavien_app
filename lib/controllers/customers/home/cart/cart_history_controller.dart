import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_history_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartHistoryController());
  }
}

class CartHistoryController extends GetxController {
  final isLoadingWaitOrder = false.obs;
  final waitOrder = CartHistoryModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWaitingOder();
  }

  void getWaitingOder() async {
    try {
      isLoadingWaitOrder.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response =
          await CartService.getCartHistory(userId: userId, status: '0');
      waitOrder.value = response?.data;
    } finally {
      isLoadingWaitOrder.value = false;
    }
  }
}
