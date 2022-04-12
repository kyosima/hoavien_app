import 'package:get/get.dart';
import 'package:hoavien_app/models/home/taisanso/taisanso_model.dart';
import 'package:hoavien_app/service_api/customer/home/taisanso/taisanso_service.dart';

class TaisansoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoController());
  }
}

class TaisansoController extends GetxController {
  final isLoadingTaisanso = false.obs;
  final allTaisanso = TaisansoModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaisanso();
  }

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

  void getTaisanso() async {
    try {
      isLoadingTaisanso.value = true;
      var response = await TaisansoService.getTaisanso();
      allTaisanso.value = response?.data;
    } finally {
      isLoadingTaisanso.value = false;
    }
  }
}
