import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CartPage extends StatelessWidget {
  final controller = Get.put(CartController());

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  if (controller.isLoadingCart.value) {
                    return Shimmer.fromColors(
                        baseColor: baseShimmer,
                        highlightColor: highLightShimmer,
                        child: ShimmerBox(height: 30, width: 200));
                  } else {
                    return Text(
                      'Thành tiền : ${NumberFormat.currency(locale: 'vi').format(controller.cartInfo.value?.total)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                }),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/checkoutdetailpage',
                        arguments: controller.cartInfo.value);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15, top: 8, bottom: 8),
                      child: Text(
                        'Đặt hàng',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [
          Stack(
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
              Center(
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
                    Center(
                        child: IconButton(
                      icon: const Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Obx(() {
                      if (controller.isLoadingCart.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.cartInfo.value?.items!.length}',
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Giỏ hàng',
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.isLoadingCart.value) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Shimmer.fromColors(
                          baseColor: baseShimmer,
                          highlightColor: highLightShimmer,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ShimmerBox(
                                    height: 120,
                                    width: 120,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ShimmerBox(height: 20, width: 100),
                                      Column(
                                        children: const [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ShimmerBox(height: 20, width: 120)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const ShimmerBox(height: 20, width: 110),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const ShimmerBox(height: 30, width: 80)
                                    ],
                                  ),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.cartInfo.value?.items!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/editcart',
                            arguments:
                                controller.cartInfo.value?.items![index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '$baseURL${controller.cartInfo.value?.items![index].content?.avatar}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Obx(
                                    () => Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${controller.cartInfo.value?.items![index].content?.name}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          controller
                                                      .cartInfo
                                                      .value
                                                      ?.items![index]
                                                      .content
                                                      ?.variation
                                                      ?.name ==
                                                  null
                                              ? Container()
                                              : Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Phân loại : ${controller.cartInfo.value?.items![index].content?.variation?.name}',
                                                      style: const TextStyle(
                                                        fontSize: 15,
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
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Đơn giá : '),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                NumberFormat.currency(
                                                        locale: 'vi')
                                                    .format(controller
                                                        .cartInfo
                                                        .value
                                                        ?.items![index]
                                                        .content
                                                        ?.price)
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.redAccent),
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
                                              Text(
                                                'x${controller.cartInfo.value?.items![index].content!.quantity}',
                                                style: const TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              const Text(
                                                'Chỉnh sửa',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        }),
      ),
    );
  }
}
