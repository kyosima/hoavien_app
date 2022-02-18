import 'package:get/get.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductsController());
  }
}

class ProductsController extends GetxController {
  List<Map<String, dynamic>> allProduct = [
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Bàn thờ cúng tổ tiên sang trọng",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
    {
      "name": "Đĩa hoa quả chất liệu đồng 3 chân",
      "kt": "D170 X H20",
      "price": "đ 125.000",
    },
  ];

  Rx<List<Map<String, dynamic>>> foundProduct =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foundProduct.value = allProduct;
  }

  void findProduct(String product) {
    List<Map<String, dynamic>> resuft = [];
    if (product.isEmpty) {
      resuft = allProduct;
      refresh();
    } else {
      resuft = allProduct
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(product.toLowerCase()))
          .toList();
    }
    foundProduct.value = resuft;
    refresh();
  }
}
