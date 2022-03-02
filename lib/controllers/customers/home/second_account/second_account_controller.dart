import 'package:get/get.dart';
import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:hoavien_app/service/customer/home/second_account/api_add_second_account.dart';
import 'package:hoavien_app/service/customer/home/second_account/api_second_account.dart';

class SecondAccountBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountController());
  }
}

class SecondAccountController extends GetxController {
  final isLoading = true.obs;
  final allSecondAccount = ListSecondAccountModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    listSecondAccount();
    super.onInit();
  }

  void listSecondAccount() async {
    final secondAccount = await ApiSecondAccount.listSecondAccount();
    try {
      isLoading.value = true;
      if (secondAccount != null) {
        allSecondAccount.value = secondAccount.data;
      } else {
        print('error');
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }

  void findSecondAccount(String phone) async {
    List<Data>? resuft = [];
    final secondAccount = await ApiSecondAccount.listSecondAccount();
    if (phone.isEmpty) {
      resuft = secondAccount?.data;
      refresh();
    } else {
      resuft = secondAccount?.data
          ?.where((element) => element.phone
              .toString()
              .toLowerCase()
              .contains(phone.toLowerCase()))
          .toList();
    }
    allSecondAccount.value = resuft;
    refresh();
  }
}
