import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/service/service_burial_detail_controller.dart';
import 'package:hoavien_app/views/widgets/custom_bottom_bar.dart';
import 'package:hoavien_app/views/widgets/custom_service.dart';
import 'package:hoavien_app/views/widgets/custom_share_button.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class ServiceBurialDetailPage extends StatelessWidget {
  final controller = Get.put(ServiceBurialDetailController());
  ServiceBurialDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomBottomBar(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const Center(
                  child: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 25,
              ))
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CustomShareButton(
            onTap: () {
              Share.share('123');
            },
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(child: Obx(() {
        if (controller.isLoadingService.value) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Shimmer.fromColors(
                      baseColor: baseShimmer,
                      highlightColor: highLightShimmer,
                      child: const ShimmerBox(
                          height: 380, width: double.infinity)),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 140,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Shimmer.fromColors(
                            baseColor: baseShimmer,
                            highlightColor: highLightShimmer,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ShimmerBox(height: 20, width: 150),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ShimmerBox(height: 20, width: 80),
                                    ShimmerBox(height: 20, width: 70),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ShimmerBox(height: 20, width: 130),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Thông tin chi tiết',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ShimmerBox(height: 50, width: 150),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Dịch vụ khác',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Obx(() {
                      if (controller.isLoadingRelatedService.value) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 289,
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 3, right: 10, top: 10, bottom: 10),
                                child: Container(
                                  width: 243.0,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Shimmer.fromColors(
                                      baseColor: baseShimmer,
                                      highlightColor: highLightShimmer,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const ShimmerBox(
                                              height: 138,
                                              width: double.infinity),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const ShimmerBox(
                                              height: 20, width: 120),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              ShimmerBox(height: 20, width: 70),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ShimmerBox(height: 20, width: 50),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const ShimmerBox(
                                              height: 40, width: 150),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 289,
                          child: ListView.builder(
                            itemCount: controller.relatedService.value!.length,
                            itemBuilder: (_, index) {
                              return CustomService(
                                  onTap: () {
                                    Get.delete<ServiceBurialDetailController>();
                                    Get.to(() => ServiceBurialDetailPage(),
                                        arguments: controller
                                            .relatedService.value![index].id);
                                    Get.toNamed('/serviceburialdetail',
                                        arguments: controller
                                            .relatedService.value![index].id);
                                  },
                                  image:
                                      '$baseURL${controller.relatedService.value![index].avatar}',
                                  title: controller.relatedService.value![index].name
                                      .toString(),
                                  price: NumberFormat.currency(locale: 'vi')
                                      .format(controller
                                          .relatedService.value![index].price),
                                  priceSale: controller.relatedService
                                              .value![index].pricePromotion ==
                                          null
                                      ? ""
                                      : NumberFormat.currency(locale: 'vi')
                                          .format(controller.relatedService
                                              .value![index].pricePromotion),
                                  info: controller
                                      .relatedService.value![index].shortDetail
                                      .toString());
                            },
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 380,
                    child: Column(
                      children: [
                        Image.network(
                          '$baseURL${controller.serviceBurial.value?.avatar}',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 140,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.serviceBurial.value!.name
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: controller.rate.value,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 23,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${controller.rate.value}/ ${controller.serviceBurial.value?.serviceReview?.length}')
                                    ],
                                  ),
                                  const Text('Đã bán : 1.5k')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    NumberFormat.currency(locale: 'vi').format(
                                        controller.serviceBurial.value?.price),
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    controller.serviceBurial.value
                                                ?.pricePromotion ==
                                            null
                                        ? ""
                                        : NumberFormat.currency(locale: 'vi')
                                            .format(controller.serviceBurial
                                                .value?.pricePromotion),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Thông tin chi tiết',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Html(data: '${controller.serviceBurial.value?.detail}'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Dịch vụ khác',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Obx(() {
                      if (controller.isLoadingRelatedService.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 289,
                          child: ListView.builder(
                            itemCount: controller.relatedService.value!.length,
                            itemBuilder: (_, index) {
                              return CustomService(
                                  onTap: () {
                                    Get.delete<ServiceBurialDetailController>();
                                    Get.to(() => ServiceBurialDetailPage(),
                                        arguments: controller
                                            .relatedService.value![index].id);
                                    Get.toNamed('/serviceburialdetail',
                                        arguments: controller
                                            .relatedService.value![index].id);
                                  },
                                  image:
                                      '$baseURL${controller.relatedService.value![index].avatar}',
                                  title: controller.relatedService.value![index].name
                                      .toString(),
                                  price: NumberFormat.currency(locale: 'vi')
                                      .format(controller
                                          .relatedService.value![index].price),
                                  priceSale: controller.relatedService
                                              .value![index].pricePromotion ==
                                          null
                                      ? ""
                                      : NumberFormat.currency(locale: 'vi')
                                          .format(controller.relatedService
                                              .value![index].pricePromotion),
                                  info: controller
                                      .relatedService.value![index].shortDetail
                                      .toString());
                            },
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            ],
          );
        }
      })),
    );
  }
}
