import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/checkout_detail_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class SelectCartTaisansoPage extends StatelessWidget {
  final controller = Get.put(CheckoutDetailController());
  SelectCartTaisansoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Lô sử dụng',
        ),
      ),
      body: SingleChildScrollView(child: Obx(() {
        if (controller.isLoadingTaisanso.value) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cartTaisanso.value!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.taisansoSelectName.value =
                        controller.cartTaisanso.value![index].name!;
                    Get.back();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.cartTaisanso.value![index].name}',
                              style: const TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Thuộc khu : ${controller.cartTaisanso.value![index].area?.name}')
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
      })),
    );
  }
}
