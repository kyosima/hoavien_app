import 'package:flutter/material.dart';
import 'package:hoavien_app/controllers/second_account/home/service/second_account_service_burial_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../constance.dart';
import 'package:get/get.dart';

class SecondAccountServiceBurial extends StatelessWidget {
  final controller = Get.put(SecondAccountServiceBurialController());
  SecondAccountServiceBurial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: secondaryColor,
          ),
          title: const CustomTitleText(
            title: 'Dịch vụ an táng, cải táng',
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
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
                                  height: double.infinity, width: 120),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        ShimmerBox(height: 20, width: 120)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const ShimmerBox(height: 20, width: 100),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const ShimmerBox(height: 40, width: 120)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      height: 160,
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
                itemCount: controller.allService.value![0].services!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/secondaccountserviceburialdetail',
                          arguments: controller
                              .allService.value![0].services![index].id);
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
                                '$baseURL${controller.allService.value![0].services![index].avatar}',
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
                                                text: controller
                                                    .allService
                                                    .value![0]
                                                    .services![index]
                                                    .name
                                                    .toString()),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            NumberFormat.currency(locale: 'vi')
                                                .format(controller
                                                    .allService
                                                    .value![0]
                                                    .services![index]
                                                    .price),
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          controller
                                                      .allService
                                                      .value![0]
                                                      .services![index]
                                                      .pricePromotion ==
                                                  null
                                              ? Container()
                                              : Text(
                                                  NumberFormat.currency(
                                                          locale: 'vi')
                                                      .format(controller
                                                          .allService
                                                          .value![0]
                                                          .services![index]
                                                          .pricePromotion),
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                        ]),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      strutStyle:
                                          const StrutStyle(fontSize: 19.0),
                                      text: TextSpan(
                                          style: const TextStyle(
                                            color: secondaryColor,
                                            fontSize: 15,
                                          ),
                                          text: controller.allService.value![0]
                                              .services![index].shortDetail
                                              .toString()),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        height: 160,
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
