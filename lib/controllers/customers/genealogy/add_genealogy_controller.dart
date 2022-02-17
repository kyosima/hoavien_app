import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGenealogyBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddGenealogyController());
  }
}

class AddGenealogyController extends GetxController {
  final birthDayController = TextEditingController();
  final deathDayController = TextEditingController();
  final nameGenealogyController = TextEditingController();
  final addressController = TextEditingController();
  final historyGenealogyController = TextEditingController();
  final nameGen1Controller = TextEditingController();
  final secondNameGen1Controller = TextEditingController();
  final deathLocationController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void setBirthday() async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    birthDayController.text = date.toString().substring(0, 10);
  }

  void setDeathday() async {
    DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    deathDayController.text = date.toString().substring(0, 10);
  }

  void addGenealogy() {
    if (nameGenealogyController.text.isEmpty ||
        addressController.text.isEmpty ||
        historyGenealogyController.text.isEmpty ||
        nameGen1Controller.text.isEmpty ||
        secondNameGen1Controller.text.isEmpty ||
        birthDayController.text.isEmpty ||
        deathDayController.text.isEmpty ||
        deathLocationController.text.isEmpty) {
      Get.defaultDialog(
          content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60.0,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(
                'assets/images/error.gif',
                width: 55,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              '''Vui lòng điền vào các trường bắt buộc!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ));
    }
  }
}
