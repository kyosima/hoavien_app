import 'package:get/get.dart';

class TaisansoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoController());
  }
}

class TaisansoController extends GetxController {
  final phanLoaiKhu = <Map>[
    {"name": 'Tất cả', "isCheck": false},
    {"name": 'Khu Phú Quý 1', "isCheck": false},
    {"name": 'Khu Phú Quý 2', "isCheck": false},
    {"name": 'Khu Phú Quý 3', "isCheck": false},
    {"name": 'Khu Phú Quý 5', "isCheck": false},
    {"name": 'Thanh Long Cát Tường', "isCheck": false},
    {"name": 'Thanh Long Vương Tộc', "isCheck": false},
  ].obs;

  void isCheck(index) {
    phanLoaiKhu[index]['isCheck'] = !phanLoaiKhu[index]['isCheck'];
    refresh();
  }
}
