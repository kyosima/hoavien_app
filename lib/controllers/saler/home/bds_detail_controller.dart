import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/area/area_detail_model.dart' hide Data;
import 'package:hoavien_app/models/area/taisanso_quickview_model.dart'
    hide Data;
import 'package:hoavien_app/models/home/taisanso/area_model.dart' show Data;
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
  final Data area = Get.arguments;
  final areaDetail = AreaDetailModel().data.obs;
  final isLoading = false.obs;
  final isLoadingQuickView = false.obs;
  final taisansoQuickview = TaisansoQuickviewModel().data.obs;
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
      var response = await AreaService.getAreaDetail(id: area.id.toString());
      areaDetail.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }

  void getTaisansoQuickview({String? id}) async {
    try {
      isLoadingQuickView.value = true;
      var response = await AreaService.getTaisansoQuickview(id: id);
      taisansoQuickview.value = response?.data;
    } finally {
      isLoadingQuickView.value = false;
    }
  }
}
