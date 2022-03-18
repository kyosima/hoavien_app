import 'package:get/get.dart';
import 'package:hoavien_app/models/auth/banner_model.dart';
import 'package:hoavien_app/models/home/service/combo_model.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:hoavien_app/models/home/service/service_model.dart';
import 'package:hoavien_app/service_api/auth/api_banner.dart';
import 'package:hoavien_app/service_api/customer/home/combo_and_service/service_combo.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  var productCount = 6.obs;
  //Banner
  final allBanner = BannerModel().data.obs;
  final isLoadingBanner = false.obs;
  //Product
  final isLoadingProduct = false.obs;
  final allProduct = ProductModel().data.obs;
  //Combo
  final isLoadingCombo = false.obs;
  final allCombo = ComboModel().data.obs;
  //Service
  final isLoadingServiceBurial = false.obs;
  final allServiceBurial = ServiceModel().data.obs;
  final isLoadingServiceDesign = false.obs;
  final allServiceDesign = ServiceModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
    getProducts();
    getCombo();
    getServiceBurial();
    getServiceDesign();
  }

  void readMore() {
    productCount = productCount + 4;
    super.update();
  }

  void getBanner() async {
    try {
      isLoadingBanner.value = true;
      var response = await ApiBanner.getBanner();
      allBanner.value = response?.data;
      update();
    } finally {
      isLoadingBanner.value = false;
    }
  }

  void getProducts() async {
    try {
      isLoadingProduct.value = true;
      var response = await ProductService.getProduct();
      allProduct.value = response?.data;
    } finally {
      isLoadingProduct.value = false;
    }
  }

  void getCombo() async {
    try {
      isLoadingCombo.value = true;
      var response = await ComboService.getCombo();
      allCombo.value = response?.data;
    } finally {
      isLoadingCombo.value = false;
    }
  }

  void getServiceBurial() async {
    try {
      isLoadingServiceBurial.value = true;
      var response = await Service.getService(id: '2');
      allServiceBurial.value = response?.data;
    } finally {
      isLoadingServiceBurial.value = false;
    }
  }

  void getServiceDesign() async {
    try {
      isLoadingServiceDesign.value = true;
      var response = await Service.getService(id: '1');
      allServiceDesign.value = response?.data;
    } finally {
      isLoadingServiceDesign.value = false;
    }
  }
}
