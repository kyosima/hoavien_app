import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/service/combo_hot_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ComboHotPage extends StatelessWidget {
  final controller = Get.put(ConboHotController());
  ComboHotPage({Key? key}) : super(key: key);

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
            title: 'Combo Hot',
          ),
        ),
        body: Obx(() {
          if (controller.isLoadingCombo.value) {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Shimmer.fromColors(
                          baseColor: baseShimmer,
                          highlightColor: highLightShimmer,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ShimmerBox(
                                height: double.infinity,
                                width: 120,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    ShimmerBox(height: 20, width: 150),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ShimmerBox(height: 20, width: 140),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ShimmerBox(height: 40, width: 140),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                itemCount: controller.allCombo.value!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/combohotdetail',
                          arguments: controller.allCombo.value![index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '$baseURL${controller.allCombo.value![index].avatar}',
                                height: double.infinity,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            strutStyle: const StrutStyle(
                                                fontSize: 19.0),
                                            text: TextSpan(
                                                style: const TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                ),
                                                text:
                                                    '${controller.allCombo.value![index].name}'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset('assets/images/hot.png')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          NumberFormat.currency(locale: 'vi')
                                              .format(controller.allCombo
                                                  .value![index].price),
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          controller.allCombo.value![index]
                                                      .pricePromotion ==
                                                  null
                                              ? ""
                                              : NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(controller
                                                      .allCombo
                                                      .value![index]
                                                      .pricePromotion),
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      strutStyle:
                                          const StrutStyle(fontSize: 19.0),
                                      text: TextSpan(
                                          style: const TextStyle(
                                            color: secondaryColor,
                                            fontSize: 14,
                                          ),
                                          text: controller.allCombo
                                              .value![index].shortDetail
                                              .toString()),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        }));
  }
}
