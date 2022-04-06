import 'package:get/get.dart';
import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:hoavien_app/service_api/customer/home/second_account/api_second_account.dart';

class ListUserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ListUserController());
  }
}

class ListUserController extends GetxController {
  final isLoading = false.obs;
  final allUser = ListSecondAccountModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListUser();
  }

  void getListUser() async {
    try {
      isLoading.value = true;
      var response = await ApiSecondAccount.listSecondAccount();
      allUser.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
