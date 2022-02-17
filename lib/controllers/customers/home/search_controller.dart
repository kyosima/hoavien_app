import 'package:get/get.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchController());
  }
}

class SearchController extends GetxController {
  final phanLoai = <Map>[
    {"title": "Tất cả", "isCheck": false},
    {"title": "Dịch vụ xây dựng và thiết kế", "isCheck": false},
    {"title": "Vật dụng", "isCheck": false}
  ].obs;

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

  void isCheck(index) {
    phanLoai[index]['isCheck'] = !phanLoai[index]['isCheck'];

    refresh();
  }
}
