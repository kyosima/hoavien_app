import 'package:get/get.dart';
import 'package:hoavien_app/models/home/service/related_service_model.dart';
import 'package:hoavien_app/models/home/service/service_detail_model.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';
import 'package:collection/collection.dart';

class ServiceDesignDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ServiceDesignDetailController());
  }
}

class ServiceDesignDetailController extends GetxController {
  final isLoadingService = false.obs;
  final serviceDetail = ServiceDetailModel().data.obs;
  final idService = Get.arguments;
  final isLoadingRelatedService = false.obs;
  final relatedService = RelatedServiceModel().data.obs;
  final rate = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailService();
    getRelatedService();
  }

  void getDetailService() async {
    print(idService);
    try {
      isLoadingService.value = true;
      var response = await Service.getDetailService(id: idService.toString());
      serviceDetail.value = response?.data;
      if (serviceDetail.value?.serviceReview?.length != 0) {
        var result =
            serviceDetail.value?.serviceReview?.map((m) => m.rating!).average;
        rate.value = result ?? 0.0;
      }
    } finally {
      isLoadingService.value = false;
    }
  }

  void getRelatedService() async {
    try {
      isLoadingRelatedService.value = true;
      var response = await Service.getRelatedService(id: idService.toString());
      relatedService.value = response?.data;
    } finally {
      isLoadingRelatedService.value = false;
    }
  }
}
