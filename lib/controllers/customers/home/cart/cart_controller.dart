import 'package:get/get.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
import 'package:hoavien_app/service_api/customer/home/cart/cart_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  var unit = 0.obs;
  final isLoadingCart = false.obs;
  final cartInfo = CartModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartInfo();
  }

  void plus() {
    unit = unit++;
    super.update();
  }

  void minus() {
    unit = unit--;
    super.update();
  }

  void getCartInfo() async {
    try {
      isLoadingCart.value = true;
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      var response = await CartService.getCartInfo(userId: userId);

      cartInfo.value = response?.data;
    } finally {
      isLoadingCart.value = false;
    }
  }
}
