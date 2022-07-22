import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/home/bds_detail_controller.dart';
import 'package:hoavien_app/models/home/taisanso/area_model.dart' show Data;
import 'package:hoavien_app/views/widgets/custom_shimmer.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class BdsDetailPage extends GetView<BdsDetailsController> {
  final Data area = Get.arguments;
  BdsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: CustomTitleText(
          title: '${area.name}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return Shimmer.fromColors(
                  baseColor: baseShimmer,
                  highlightColor: highLightShimmer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff61C236),
                            border: Border.all(color: Colors.green, width: 8)),
                        child: const ShimmerBox(
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ShimmerBox(height: 10, width: 80),
                                    ShimmerBox(height: 10, width: 80),
                                    ShimmerBox(height: 10, width: 80),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ShimmerBox(height: 10, width: 80),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const ShimmerBox(height: 30, width: 80),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, indexChild) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ShimmerBox(height: 15, width: 80),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (context, indexRow) {
                                      return Column(
                                        children: [
                                          GridView.count(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            crossAxisCount: 6,
                                            children: List.generate(
                                                8,
                                                (index) => const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: ShimmerBox(
                                                          height: 40,
                                                          width: 40),
                                                    )),
                                          ),
                                          const SizedBox(
                                            height: 17,
                                          ),
                                        ],
                                      );
                                    })
                              ],
                            );
                          }),
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff61C236),
                          border: Border.all(color: Colors.green, width: 8)),
                      child: CachedNetworkImage(
                        imageUrl:
                            '$baseURL${controller.areaDetail.value?.avatar}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Color(0xffFD81FD),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đã cọc/ giữ chổ',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Color(0xff61C236),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đã bán',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Color(0xffFE7E00),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đã sử dụng',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
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
                                    children: const [
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: secondaryColor,
                                        child: CircleAvatar(
                                          radius: 7,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đang trống',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          alignment: Alignment.centerLeft),
                      onPressed: () {
                        controller.showTableDetail();
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: colorText,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bảng thống kê',
                                style: TextStyle(
                                  color: secondaryColor,
                                ),
                              ),
                              Icon(controller.showTable.value == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.showTable.value == true
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/bang.png'),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.areaDetail.value?.child!.length,
                        itemBuilder: (context, indexChild) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.areaDetail.value?.child![indexChild].name}',
                                style: const TextStyle(
                                    color: secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .areaDetail
                                      .value
                                      ?.child![indexChild]
                                      .digitalAssets!
                                      .length,
                                  itemBuilder: (context, indexRow) {
                                    return Column(
                                      children: [
                                        GridView.count(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          crossAxisCount: 6,
                                          children: List.generate(
                                              controller
                                                  .areaDetail
                                                  .value!
                                                  .child![indexChild]
                                                  .digitalAssets![indexRow]
                                                  .length,
                                              (index) => GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .getTaisansoQuickview(
                                                              id: controller
                                                                  .areaDetail
                                                                  .value!
                                                                  .child![
                                                                      indexChild]
                                                                  .digitalAssets![
                                                                      indexRow]
                                                                      [index]
                                                                  .id
                                                                  .toString());
                                                      Get.defaultDialog(
                                                        content: Obx(() {
                                                          if (controller
                                                              .isLoadingQuickView
                                                              .value) {
                                                            return const CircularProgressIndicator();
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: const [
                                                                      Icon(
                                                                        Icons
                                                                            .info,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                        'Thông tin lô',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              15,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Tên lô',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              secondaryColor,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${controller.taisansoQuickview.value?.name}',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              secondaryColor,
                                                                          fontSize:
                                                                              14,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Khu',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${controller.taisansoQuickview.value?.area?.name}',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Kích thước',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${controller.taisansoQuickview.value?.size?.length} x ${controller.taisansoQuickview.value?.size?.width}',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Diện tích',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${(controller.taisansoQuickview.value!.size!.length! * controller.taisansoQuickview.value!.size!.width!).toStringAsFixed(2)} m2',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Giá bán',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        NumberFormat.currency(locale: 'vi').format(controller
                                                                            .taisansoQuickview
                                                                            .value
                                                                            ?.price),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.green,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Giá CSBQ',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        NumberFormat.currency(locale: 'vi').format(controller
                                                                            .taisansoQuickview
                                                                            .value
                                                                            ?.priceTakeCare),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.green,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Kim tiền',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        NumberFormat.currency(locale: 'vi').format(controller
                                                                            .taisansoQuickview
                                                                            .value
                                                                            ?.priceCoffin),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.green,
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
                                                                    children: [
                                                                      const Text(
                                                                        'Tổng giá',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        NumberFormat.currency(locale: 'vi').format(controller.taisansoQuickview.value!.price! +
                                                                            controller.taisansoQuickview.value!.priceTakeCare! +
                                                                            controller.taisansoQuickview.value!.priceCoffin!),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  const Text(
                                                                    'Khi bạn giữ chỗ người khác sẽ không thể đặt tiếp',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          secondaryColor,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                          Get.defaultDialog(
                                                                              content: Column(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.check_circle,
                                                                                size: 70,
                                                                                color: Colors.green,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              const Text(
                                                                                'Giữ chổ thành công',
                                                                                style: TextStyle(
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: secondaryColor,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              const Text(
                                                                                'Hệ thống đã xác nhận thông tin giữ chổ của bạn',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  fontSize: 15,
                                                                                  color: colorText,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextButton(
                                                                                  onPressed: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(7),
                                                                                      color: primaryColor,
                                                                                    ),
                                                                                    width: double.infinity,
                                                                                    child: const Center(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(10.0),
                                                                                        child: Text(
                                                                                          'OK',
                                                                                          style: TextStyle(
                                                                                            color: secondaryColor,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ))
                                                                            ],
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              border: Border.all(
                                                                                color: secondaryColor,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Center(child: Text('Giữ chổ')),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                          Get.defaultDialog(
                                                                              content: Column(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.check_circle,
                                                                                size: 70,
                                                                                color: Colors.green,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              const Text(
                                                                                'Đặt cọc thành công',
                                                                                style: TextStyle(
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: secondaryColor,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              const Text(
                                                                                'Hệ thống sẽ kiểm tra tiền đặt cọc đối với lô bạn đã đặt cọc và xác nhận thông tin.',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  fontSize: 15,
                                                                                  color: colorText,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextButton(
                                                                                  onPressed: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(7),
                                                                                      color: primaryColor,
                                                                                    ),
                                                                                    width: double.infinity,
                                                                                    child: const Center(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(10.0),
                                                                                        child: Text(
                                                                                          'OK',
                                                                                          style: TextStyle(
                                                                                            color: secondaryColor,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ))
                                                                            ],
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                color: primaryColor,
                                                                              ),
                                                                              color: primaryColor,
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Center(child: Text('Đặt cọc')),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        }),
                                                        barrierDismissible:
                                                            true,
                                                        radius: 10.0,
                                                      );
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: controller
                                                                          .areaDetail
                                                                          .value
                                                                          ?.child![
                                                                              indexChild]
                                                                          .digitalAssets![
                                                                              indexRow]
                                                                              [
                                                                              index]
                                                                          .status ==
                                                                      0
                                                                  ? secondaryColor
                                                                  : Colors
                                                                      .white),
                                                          color: controller
                                                                      .areaDetail
                                                                      .value
                                                                      ?.child![
                                                                          indexChild]
                                                                      .digitalAssets![
                                                                          indexRow]
                                                                          [
                                                                          index]
                                                                      .status ==
                                                                  1
                                                              ? const Color(
                                                                  0xffFD81FD)
                                                              : controller
                                                                          .areaDetail
                                                                          .value
                                                                          ?.child![
                                                                              indexChild]
                                                                          .digitalAssets![
                                                                              indexRow]
                                                                              [
                                                                              index]
                                                                          .status ==
                                                                      2
                                                                  ? const Color(
                                                                      0xff61C236)
                                                                  : controller
                                                                              .areaDetail
                                                                              .value
                                                                              ?.child![indexChild]
                                                                              .digitalAssets![indexRow][index]
                                                                              .status ==
                                                                          3
                                                                      ? const Color(0xffFE7E00)
                                                                      : Colors.white,
                                                        ),
                                                        height: 100,
                                                        child: Center(
                                                          child: Text(
                                                            'H${controller.areaDetail.value?.child![indexChild].digitalAssets![indexRow][index].row}.${controller.areaDetail.value?.child![indexChild].digitalAssets![indexRow][index].column}',
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  secondaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                        const SizedBox(
                                          height: 17,
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          );
                        }),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
