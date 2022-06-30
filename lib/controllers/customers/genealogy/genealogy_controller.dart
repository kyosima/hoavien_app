import 'package:get/get.dart';
import 'package:hoavien_app/models/genealogy/list_genalogy_model.dart';
import 'package:hoavien_app/service_api/customer/genalogy/genealogy_service.dart';

class GenealogyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GenealogyController());
  }
}

class GenealogyController extends GetxController {
  final isLoading = false.obs;
  var allGenalogy = ListGenealogyModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ListGenealogy();
  }

  void ListGenealogy() async {
    final listGenalogy = await GenealogyService.ListGenealogy();
    try {
      isLoading.value = false;
      if (listGenalogy != null) {
        allGenalogy.value = listGenalogy.data;
        print(listGenalogy.data);
      } else {
        print('error');
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
