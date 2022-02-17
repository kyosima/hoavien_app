import 'package:get/get.dart';

class SecondAccountGenealogyBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SecondAccountGenealogyController());
  }
}

class SecondAccountGenealogyController extends GetxController{
}