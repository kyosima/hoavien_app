import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/customers/home/product/product_detail_controller.dart';
import 'package:hoavien_app/views/widgets/custom_bottom_bar.dart';
import 'package:hoavien_app/views/widgets/custom_share_button.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constance.dart';

class ProductDetailPage extends StatelessWidget {
  final controller = Get.put(ProductDetailController());

  ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomBar(
        onPressedAddToCart: () async {
          final prefs = await SharedPreferences.getInstance();
          final userId = prefs.getInt('id').toString();
          controller.addToCart(
            userId: userId,
            productId: controller.product.value?.id.toString(),
            variationId: controller.variationSelect.value == 0
                ? null
                : controller.variationSelect.value.toString(),
          );
        },
      ),
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
            width: 5,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoadingProduct.value) {
          return SingleChildScrollView(
            child: Shimmer.fromColors(
              baseColor: baseShimmer,
              highlightColor: highLightShimmer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ShimmerBox(height: 250, width: double.infinity),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
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
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ShimmerBox(height: 12, width: 100),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        ShimmerBox(height: 12, width: 100),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ShimmerBox(height: 12, width: 30)
                                      ],
                                    ),
                                    const ShimmerBox(height: 12, width: 40)
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ShimmerBox(height: 12, width: 80),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ShimmerBox(height: 12, width: 100),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Phân loại',
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Xem chi tiết',
                                ))
                          ],
                        ),
                        const Text(
                          '1',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: secondaryColor,
                                        )),
                                    child: TextButton(
                                      child: const ShimmerBox(
                                          height: 12, width: 80),
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const Divider(
                          height: 15,
                          thickness: 1,
                        ),
                        const Text(
                          'Chi tiết dịch vụ',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ShimmerBox(height: 20, width: 150),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Sản phẩm liên quan',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            ShimmerBox(height: 130, width: 130),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ShimmerBox(height: 12, width: 80),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ShimmerBox(height: 12, width: 80),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ShimmerBox(height: 12, width: 80),
                                          ],
                                        ),
                                      ),
                                    ));
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageSlideshow(
                  /// Width of the [ImageSlideshow].
                  width: double.infinity,
                  height: 250,

                  /// Height of the [ImageSlideshow].

                  /// The page to show when first creating the [ImageSlideshow].
                  initialPage: 0,

                  /// The color to paint the indicator.
                  indicatorColor: secondaryColor,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.grey,

                  /// Called whenever the page in the center of the viewport changes.

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 7000,

                  /// Loops back to first slide.
                  isLoop: true,

                  /// The widgets to display in the [ImageSlideshow].
                  /// Add the sample image file into the images folder
                  children: [
                    Image.network(
                      '$baseURL${controller.product.value?.avatar}',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    for (var i = 0;
                        i <
                            num.parse(
                                '${controller.product.value?.productGallery?.length}');
                        i++) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          '$baseURL${controller.product.value?.productGallery![i].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.product.value?.name}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: secondaryColor,
                                ),
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
                                        onRatingUpdate: (rating) {},
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${controller.rate.value.toStringAsFixed(2)} /${controller.product.value?.productReview?.length}'),
                                    ],
                                  ),
                                  const Text('Đã bán : 1.5k')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.price.value == 0
                                    ? NumberFormat.currency(locale: 'vi')
                                        .format(controller.product.value?.price)
                                    : NumberFormat.currency(locale: 'vi')
                                        .format(controller.price.value),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Kích thước : ${controller.product.value?.size}')
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 15,
                        thickness: 1,
                      ),
                      controller.product.value!.productAttributes!.isEmpty
                          ? Container()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .product.value?.productAttributes!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.product.value?.productAttributes![index].name}',
                                      style: const TextStyle(
                                        color: secondaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: controller
                                              .product
                                              .value
                                              ?.productAttributes![index]
                                              .productAttributeVariation!
                                              .length,
                                          itemBuilder: (context, index1) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Obx(
                                                () => Container(
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .selectedVariation
                                                                  .value ==
                                                              index1
                                                          ? primaryColor
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: controller
                                                                      .selectedVariation
                                                                      .value ==
                                                                  index1
                                                              ? primaryColor
                                                              : secondaryColor)),
                                                  child: TextButton(
                                                    child: Text(
                                                      '${controller.product.value?.productAttributes![index].productAttributeVariation![index1].name}',
                                                      style: TextStyle(
                                                          color: controller
                                                                      .selectedVariation
                                                                      .value ==
                                                                  index1
                                                              ? Colors.white
                                                              : secondaryColor),
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .changeButton(index1);
                                                      controller.price.value =
                                                          controller
                                                              .product
                                                              .value!
                                                              .productAttributes![
                                                                  index]
                                                              .productAttributeVariation![
                                                                  index1]
                                                              .price!;
                                                      controller.variationSelect
                                                              .value =
                                                          controller
                                                              .product
                                                              .value!
                                                              .productAttributes![
                                                                  index]
                                                              .productAttributeVariation![
                                                                  index1]
                                                              .id!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    const Divider(
                                      height: 15,
                                      thickness: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Chi tiết dịch vụ',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Html(data: '${controller.product.value?.detail}'),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Sản phẩm liên quan',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.relatedProduct.value?.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.delete<ProductDetailController>();
                                  Get.to(() => ProductDetailPage(),
                                      arguments: controller
                                          .relatedProduct.value![index].id);
                                  Get.toNamed(('/productdetail'),
                                      arguments: controller
                                          .relatedProduct.value![index].id);
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              '$baseURL${controller.relatedProduct.value![index].avatar}',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: 130,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Flexible(
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                strutStyle: const StrutStyle(
                                                    fontSize: 17.0),
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: secondaryColor),
                                                  text:
                                                      '${controller.relatedProduct.value![index].name}',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Flexible(
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                strutStyle: const StrutStyle(
                                                    fontSize: 16.0),
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      color: secondaryColor),
                                                  text:
                                                      'Kích thước :  ${controller.relatedProduct.value![index].size}',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Flexible(
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                strutStyle: const StrutStyle(
                                                    fontSize: 17.0),
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                  text:
                                                      'Giá :  ${NumberFormat.currency(locale: 'vi').format(controller.relatedProduct.value![index].price)}',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              );
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
