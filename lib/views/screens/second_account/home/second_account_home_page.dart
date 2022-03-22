import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/second_account/home/secondaccount_home_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_home_page.dart';
import 'package:hoavien_app/views/widgets/custom_products.dart';
import 'package:hoavien_app/views/widgets/custom_service.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:hoavien_app/views/widgets/customsearch.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SecondAccountHomePage extends GetView<SecondAccountHomeController> {
  @override
  final controller = Get.put(SecondAccountHomeController());
  SecondAccountHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomSearch(
          onPressed: () {
            Get.toNamed('/searchresuft');
          },
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                  child: IconButton(
                onPressed: () {
                  Get.toNamed('/notification');
                },
                icon: const Icon(Icons.notifications),
              ))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                  child: IconButton(
                icon: const Icon(
                  Icons.shopping_basket,
                ),
                onPressed: () {
                  Get.toNamed('/cart');
                },
              ))
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoadingBanner.value) {
                  return Shimmer.fromColors(
                      baseColor: baseShimmer,
                      highlightColor: highLightShimmer,
                      child: const ShimmerBox(
                          height: 200, width: double.infinity));
                } else {
                  return ImageSlideshow(
                    /// Width of the [ImageSlideshow].
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].

                    /// The page to show when first creating the [ImageSlideshow].
                    initialPage: 0,

                    /// The color to paint the indicator.
                    indicatorColor: secondaryColor,

                    /// The color to paint behind th indicator.
                    indicatorBackgroundColor: Colors.grey,

                    /// The widgets to display in the [ImageSlideshow].
                    /// Add the sample image file into the images folder
                    children: [
                      for (var i = 0;
                          i <
                              num.parse(controller.allBanner.value!.length
                                  .toString());
                          i++) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            '$baseURL${controller.allBanner.value![i].image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                    ],

                    /// Called whenever the page in the center of the viewport changes.

                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.
                    autoPlayInterval: 7000,

                    /// Loops back to first slide.
                    isLoop: true,
                  );
                }
              }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonHomePage(
                    tittle: 'Quét Qr',
                    icon: Icons.qr_code,
                    onTap: () {
                      Get.toNamed('/qrscan');
                    },
                  ),
                  CustomButtonHomePage(
                    tittle: 'Tài sản số',
                    icon: Icons.account_balance,
                    onTap: () {
                      Get.toNamed('/taisanso');
                    },
                  ),
                  CustomButtonHomePage(
                    tittle: 'Thanh toán',
                    icon: Icons.credit_card,
                    onTap: () {
                      Get.toNamed('/checkout');
                    },
                  ),
                  CustomButtonHomePage(
                    tittle: 'Hỗ trợ',
                    icon: Icons.support_agent,
                    onTap: () {
                      print('QR');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/vector.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      const CustomTitleText(title: 'ComBo HOT'),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/combohot');
                      },
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
              Obx(() {
                if (controller.isLoadingCombo.value) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 300,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ShimmerBox(
                                        height: 135, width: double.infinity),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 150),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        ShimmerBox(height: 30, width: 80),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ShimmerBox(height: 30, width: 50),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 90),
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
                      itemCount: controller.allCombo.value!.length,
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CustomService(
                            onTap: () {},
                            image:
                                '$baseURL${controller.allCombo.value![index].avatar}',
                            title: controller.allCombo.value![index].name
                                .toString(),
                            price: NumberFormat.currency(locale: 'vi').format(
                                controller.allCombo.value![index].price),
                            priceSale: controller.allCombo.value![index]
                                        .pricePromotion ==
                                    null
                                ? ""
                                : NumberFormat.currency(locale: 'vi').format(
                                    controller
                                        .allCombo.value![index].pricePromotion),
                            info: controller.allCombo.value![index].shortDetail
                                .toString());
                      },
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CustomTitleText(title: 'Dịch vụ an táng, cải táng'),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/dichvuantangcaitang');
                      },
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
              Obx(() {
                if (controller.isLoadingServiceBurial.value) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 300,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ShimmerBox(
                                        height: 135, width: double.infinity),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 150),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        ShimmerBox(height: 30, width: 80),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ShimmerBox(height: 30, width: 50),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 90),
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
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          controller.serviceBurial.value![0].services!.length,
                      itemBuilder: (_, index) {
                        return CustomService(
                            onTap: () {},
                            image:
                                '$baseURL${controller.serviceBurial.value![0].services![index].avatar}',
                            title: controller
                                .serviceBurial.value![0].services![index].name
                                .toString(),
                            price: NumberFormat.currency(locale: 'vi').format(controller
                                .serviceBurial
                                .value![0]
                                .services![index]
                                .price),
                            priceSale: controller.serviceBurial.value![0]
                                        .services![index].pricePromotion ==
                                    null
                                ? ""
                                : NumberFormat.currency(locale: 'vi').format(controller
                                    .serviceBurial
                                    .value![0]
                                    .services![index]
                                    .pricePromotion),
                            info: controller.serviceBurial.value![0]
                                .services![index].shortDetail
                                .toString());
                      },
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CustomTitleText(title: 'Dịch vụ thiết kế và xây dựng'),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/dichvuthietkexaydung');
                      },
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
              Obx(() {
                if (controller.isLoadingServiceDesign.value) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 300,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ShimmerBox(
                                        height: 135, width: double.infinity),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 150),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        ShimmerBox(height: 30, width: 80),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ShimmerBox(height: 30, width: 50),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ShimmerBox(height: 30, width: 90),
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
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          controller.serviceDesign.value![0].services!.length,
                      itemBuilder: (_, index) {
                        return CustomService(
                            onTap: () {},
                            image:
                                '$baseURL${controller.serviceDesign.value![0].services![index].avatar}',
                            title: controller
                                .serviceDesign.value![0].services![index].name
                                .toString(),
                            price: NumberFormat.currency(locale: 'vi').format(controller
                                .serviceDesign
                                .value![0]
                                .services![index]
                                .price),
                            priceSale: controller.serviceDesign.value![0]
                                        .services![index].pricePromotion ==
                                    null
                                ? ""
                                : NumberFormat.currency(locale: 'vi').format(controller
                                    .serviceDesign
                                    .value![0]
                                    .services![index]
                                    .pricePromotion),
                            info: controller.serviceDesign.value![0]
                                .services![index].shortDetail
                                .toString());
                      },
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTitleText(title: 'Vật dụng thờ cúng'),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/secondaccountproduct');
                      },
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isLoadingProduct.value) {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: (0.64),

                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(4, (index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
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
                              padding: const EdgeInsets.all(8.0),
                              child: Shimmer.fromColors(
                                baseColor: baseShimmer,
                                highlightColor: highLightShimmer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ShimmerBox(
                                        height: 140, width: double.infinity),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ShimmerBox(height: 20, width: 140),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ShimmerBox(height: 20, width: 120),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ShimmerBox(height: 20, width: 100),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: (0.64),

                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(controller.allProduct.value!.length,
                        (index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
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
                              padding: const EdgeInsets.all(8.0),
                              child: CustomProducts(
                                  onTap: () => Get.toNamed(
                                      '/secondaccountproductdetail',
                                      arguments: controller
                                          .allProduct.value![index].id),
                                  image:
                                      '$baseURL${controller.allProduct.value![index].avatar}',
                                  title:
                                      '${controller.allProduct.value![index].name}',
                                  size:
                                      '${controller.allProduct.value![index].size}',
                                  price: NumberFormat.currency(locale: 'vi')
                                      .format(controller
                                          .allProduct.value![index].price)),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              }),
              Center(
                child: SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: () {
                      controller.readmore();
                    },
                    child: Text('Xem Thêm'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
