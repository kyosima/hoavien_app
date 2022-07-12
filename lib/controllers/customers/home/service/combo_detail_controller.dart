import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/home/service/combo_detail_model.dart';
import 'package:hoavien_app/models/home/service/combo_model.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';

class ComboDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ComboDetailController());
  }
}

class ComboDetailController extends GetxController {
  final isLoadingCombo = false.obs;
  final comboDetail = ComboDetailModel().data.obs;
  final idCombo = Get.arguments;
  final rate = 0.0.obs;
  final isLoadingRelatedCombo = false.obs;
  final relatedCombo = ComboModel().data.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getComboDetail();
    getRelatedCombo();
  }

  void getComboDetail() async {
    try {
      isLoadingCombo.value = true;
      var response = await ComboService.getComboDetail(id: idCombo.toString());
      comboDetail.value = response?.data;
      if (comboDetail.value?.comboReview != null) {
        var result =
            comboDetail.value?.comboReview?.map((m) => m.rating!).average;
        rate.value = result ?? 0.0;
      }
    } finally {
      isLoadingCombo.value = false;
    }
  }

  void getRelatedCombo() async {
    try {
      isLoadingRelatedCombo.value = true;
      var response = await ComboService.getRelatedCombo(id: idCombo.toString());
      relatedCombo.value = response?.data;
    } finally {
      isLoadingRelatedCombo.value = false;
    }
  }
}
