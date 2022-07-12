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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
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
                  physics: NeverScrollableScrollPhysics(),
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
                                  ShimmerBox(
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
                                      ShimmerBox(height: 20, width: 100),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ShimmerBox(height: 20, width: 120)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ShimmerBox(height: 20, width: 110),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ShimmerBox(height: 30, width: 80)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.cartInfo.value!.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                CachedNetworkImage(
                                  imageUrl:
                                      '$baseURL${controller.cartInfo.value![index].content?.avatar}',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
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
                                          '${controller.cartInfo.value![index].content?.name}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: secondaryColor,
                                          ),
                                        ),
                                        controller.cartInfo.value![index]
                                                    .content?.variation?.name ==
                                                null
                                            ? Container()
                                            : Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Phân loại : ${controller.cartInfo.value![index].content?.variation?.name}',
                                                    style: TextStyle(
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
                                            Text('Đơn giá :'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'vi')
                                                  .format(controller
                                                      .cartInfo
                                                      .value![index]
                                                      .content
                                                      ?.price)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.minus();
                                              },
                                              child: Stack(
                                                children: const [
                                                  CircleAvatar(
                                                    radius: 17,
                                                    backgroundColor:
                                                        secondaryColor,
                                                    child: CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                          Color(0xffE6D4CB),
                                                      foregroundColor:
                                                          secondaryColor,
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                child: Text(
                                                    '${controller.cartInfo.value![index].content?.quantity}')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.plus();
                                              },
                                              child: Stack(
                                                children: const [
                                                  CircleAvatar(
                                                    radius: 17,
                                                    backgroundColor:
                                                        secondaryColor,
                                                    child: CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                          Color(0xffE6D4CB),
                                                      foregroundColor:
                                                          secondaryColor,
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
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
                    );
                  }),
            );
          }
        }),
      ),
    );
  }
}
