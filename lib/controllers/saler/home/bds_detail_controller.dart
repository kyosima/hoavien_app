import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/area/area_detail_model.dart';
import 'package:hoavien_app/service_api/area/area_service.dart';

class BdsDetailsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BdsDetailsController());
  }
}

class BdsDetailsController extends GetxController {
  final showTable = false.obs;
  final arenaController = TextEditingController();
  final id = Get.arguments.toString();
  final areaDetail = AreaDetailModel().data.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAreaDetail();
  }

  void showTableDetail() {
    showTable.value = !showTable.value;
  }

  void getAreaDetail() async {
    try {
      isLoading.value = true;
      var response = await AreaService.getAreaDetail(id: id);
      areaDetail.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
