import 'package:get/get.dart';
import 'package:hoavien_app/models/second_account/second_account_model.dart';
import 'package:hoavien_app/service/customer/api_add_second_account.dart';

class SecondAccountBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountController());
  }
}

class SecondAccountController extends GetxController {
  final List<Map<String, dynamic>> allSeconAccount = [
    {
      "phoneNumber": "0338927456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "0905478292",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "0386527456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "0398747456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "03329247456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "0329327456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
    {
      "phoneNumber": "03389975456",
      "name": "Nguyễn Chính Hưng",
      "relationship": "Con gái"
    },
  ];
  Rx<List<Map<String, dynamic>>> foundSecondAccount =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foundSecondAccount.value = allSeconAccount;
  }

  void findSecondAccount(String secondAccount) {
    List<Map<String, dynamic>> resuft = [];

    if (secondAccount.isEmpty) {
      resuft = allSeconAccount;
      refresh();
    } else {
      resuft = allSeconAccount
          .where((element) => element['phoneNumber']
              .toString()
              .toLowerCase()
              .contains(secondAccount.toLowerCase()))
          .toList();
    }
    foundSecondAccount.value = resuft;
    refresh();
  }
}
