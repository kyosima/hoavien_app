import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_history_controller.dart';
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CartHistoryPage extends StatelessWidget {
  final controller = Get.put(CartHistoryController());
  CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Lịch sử mua hàng',
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonsTabBar(
                  backgroundColor: primaryColor,
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(color: secondaryColor),
                  labelStyle: const TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      color: secondaryColor,
                      fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "Chờ xác nhận",
                    ),
                    Tab(
                      text: "Đã hoàn thành",
                    ),
                    Tab(
                      text: "Đã hủy",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Obx(() {
                      if (controller.isLoadingWaitOrder.value) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: baseShimmer,
                                    highlightColor: highLightShimmer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              ShimmerBox(height: 10, width: 60),
                                              ShimmerBox(height: 10, width: 40),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ShimmerBox(
                                                  height: 100, width: 100),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 120),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ShimmerBox(height: 20, width: 60),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: controller.waitOrder.value!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Chờ xác nhận ',
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(controller
                                                      .waitOrder
                                                      .value![index]
                                                      .createdAt
                                                      .toString())),
                                              style: const TextStyle(
                                                color: secondaryColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '$baseURL${controller.waitOrder.value![index].orderDetail?.avatar}',
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.waitOrder.value?[index].orderDetail?.name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  controller
                                                              .waitOrder
                                                              .value![index]
                                                              .orderDetail
                                                              ?.variation ==
                                                          null
                                                      ? Container()
                                                      : Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Phân loại : ${controller.waitOrder.value![index].orderDetail?.variation?.name}  ',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    secondaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(controller.waitOrder.value![index].orderDetail?.price)}',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: secondaryColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'x ${controller.waitOrder.value![index].orderDetail?.quantity}',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.toNamed(
                                                    '/donhangchoxacnhan',
                                                    arguments: controller
                                                        .waitOrder
                                                        .value![index]
                                                        .id);
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Xem chi tiết',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                    Obx(() {
                      if (controller.isLoadingDoneOrder.value) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: baseShimmer,
                                    highlightColor: highLightShimmer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              ShimmerBox(height: 10, width: 60),
                                              ShimmerBox(height: 10, width: 40),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ShimmerBox(
                                                  height: 100, width: 100),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 120),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ShimmerBox(height: 20, width: 60),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: controller.doneOrder.value!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Đã hoàn thành ',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(controller
                                                      .doneOrder
                                                      .value![index]
                                                      .createdAt
                                                      .toString())),
                                              style: const TextStyle(
                                                color: secondaryColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '$baseURL${controller.doneOrder.value![index].orderDetail?.avatar}',
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.doneOrder.value?[index].orderDetail?.name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  controller
                                                              .doneOrder
                                                              .value![index]
                                                              .orderDetail
                                                              ?.variation ==
                                                          null
                                                      ? Container()
                                                      : Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Phân loại : ${controller.doneOrder.value![index].orderDetail?.variation?.name}  ',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    secondaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(controller.doneOrder.value![index].orderDetail?.price)}',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: secondaryColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'x ${controller.doneOrder.value![index].orderDetail?.quantity}',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.toNamed(
                                                    '/donhangdahoanthanh',
                                                    arguments: controller
                                                        .doneOrder
                                                        .value![index]
                                                        .id);
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Xem chi tiết',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                    Obx(() {
                      if (controller.isLoadingCancelOrder.value) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Shimmer.fromColors(
                                    baseColor: baseShimmer,
                                    highlightColor: highLightShimmer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              ShimmerBox(height: 10, width: 60),
                                              ShimmerBox(height: 10, width: 40),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ShimmerBox(
                                                  height: 100, width: 100),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 80),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    ShimmerBox(
                                                        height: 10, width: 120),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ShimmerBox(height: 20, width: 60),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: controller.cancelOrderCart.value!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Đã hủy ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(controller
                                                      .cancelOrderCart
                                                      .value![index]
                                                      .createdAt
                                                      .toString())),
                                              style: const TextStyle(
                                                color: secondaryColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '$baseURL${controller.cancelOrderCart.value![index].orderDetail?.avatar}',
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.cancelOrderCart.value?[index].orderDetail?.name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  controller
                                                              .cancelOrderCart
                                                              .value![index]
                                                              .orderDetail
                                                              ?.variation ==
                                                          null
                                                      ? Container()
                                                      : Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Phân loại : ${controller.cancelOrderCart.value![index].orderDetail?.variation?.name}  ',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    secondaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(controller.cancelOrderCart.value![index].orderDetail?.price)}',
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: secondaryColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'x ${controller.cancelOrderCart.value![index].orderDetail?.quantity}',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.toNamed('/donhangdahuy',
                                                    arguments: controller
                                                        .cancelOrderCart
                                                        .value![index]
                                                        .id);
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Xem chi tiết',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
