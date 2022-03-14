import 'package:get/get.dart';
import 'package:hoavien_app/models/home/product/product_model.dart';
import 'package:hoavien_app/service_api/customer/home/product/product_service.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductsController());
  }
}

class ProductsController extends GetxController {
  final filterCategory = <Map>[
    {
      'category': 'Tất cả',
      'isCheck': false,
    },
    {
      'category': 'Danh mục 1',
      'isCheck': false,
    },
    {
      'category': 'Danh mục 2',
      'isCheck': false,
    },
    {
      'category': 'Danh mục 3',
      'isCheck': false,
    },
    {
      'category': 'Danh mục 4',
      'isCheck': false,
    },
  ].obs;
  final allProduct = ProductModel().data.obs;
  final isLoadingProduct = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    try {
      isLoadingProduct.value = true;
      var response = await ProductService.getProduct();
      allProduct.value = response?.data;
      update();
    } finally {
      isLoadingProduct.value = false;
      update();
    }
  }

  void findProduct(String product) async {
    List<Data>? resuft = [];
    var response = await ProductService.getProduct();

    if (product.isEmpty) {
      resuft = response?.data;
      refresh();
    } else {
      resuft = response?.data
          ?.where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(product.toLowerCase()))
          .toList();
    }
    allProduct.value = resuft;
    refresh();
  }

  void filterProduct(int index) {
    filterCategory[index]['isCheck'] = !filterCategory[index]['isCheck'];
    refresh();
  }
}
