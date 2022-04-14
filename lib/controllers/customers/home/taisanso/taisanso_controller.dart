import 'package:get/get.dart';
import 'package:hoavien_app/models/home/taisanso/area_model.dart';
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
  final phanLoaiKhu2 = [].obs;
  final isLoadingArea = false.obs;
  final allArea = AreaModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaisanso();
    getArea();
    filter();
  }

  void filter() {
    List list = ['steve', 'bill', 'musk'];
    List map = [
      for (var item in list)
        {
          'name': '$item',
          'isChecked': false,
        }
    ].obs;
    phanLoaiKhu2.value = map;
    update();
  }

  final phanLoaiKhu = <Map>[
    {"name": 'Tất cả', "isCheck": false},
    {"name": 'Khu Phú Quý 1', "isCheck": false},
    {"name": 'Khu Phú Quý 2', "isCheck": false},
  ].obs;

  void isCheck(index) {
    phanLoaiKhu2[index]['isCheck'] = !phanLoaiKhu2[index]['isCheck'];
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

  void getArea() async {
    try {
      isLoadingArea.value = true;
      var response = await TaisansoService.getArea();
      allArea.value = response?.data;
    } finally {
      isLoadingArea.value = false;
    }
  }
}
