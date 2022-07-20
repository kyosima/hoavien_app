import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_history_controller.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_history_waitting_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';

class CartHistoryDetailWaittingPage extends StatelessWidget {
  final controller = Get.put(CartHistoryWaittingController());
  final controller2 = Get.put(CartHistoryController());
  CartHistoryDetailWaittingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Thông tin đặt hàng',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey[200],
            child: Obx(() {
              if (controller.isLoadingDetailWaitOrder.value) {
                return const Center(child: const CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Chờ xác nhận',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  controller
                                      .detailWaitOrder.value![0].createdAt!)),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.detailWaitOrder.value![0].digitalAssetUse?.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controller.detailWaitOrder.value![0].contact?.fullname}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controller.detailWaitOrder.value![0].contact?.phone}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Ngày sử dụng : ${DateFormat('dd-MM-yyyy').format(DateTime.parse('${controller.detailWaitOrder.value![0].dateUse}'))}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .detailWaitOrder.value![0].orderDetails!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5,
                                  ),
                                  child: Column(
                                    children: [
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
                                                  '$baseURL${controller.detailWaitOrder.value![0].orderDetails![index].content?.avatar}',
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
                                                  '${controller.detailWaitOrder.value![0].orderDetails![index].content?.name}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: secondaryColor,
                                                  ),
                                                ),
                                                controller
                                                            .detailWaitOrder
                                                            .value![0]
                                                            .orderDetails![
                                                                index]
                                                            .content
                                                            ?.variation ==
                                                        null
                                                    ? Container()
                                                    : Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            'Phân loại : ${controller.detailWaitOrder.value![0].orderDetails![index].content?.variation?.name}',
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
                                                      'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(controller.detailWaitOrder.value![0].orderDetails![index].content?.price)}',
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'x ${controller.detailWaitOrder.value![0].orderDetails![index].content?.quantity}',
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ],
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '''Hình thức thanh toán
( Nhân viên của chúng tôi sẽ gọi điện và cung cấp thông tin thanh toán cho quý khách hàng )''',
                          style: TextStyle(
                              color: colorText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomTextField(
                        enable: false,
                        title: 'Ghi chú',
                        inputType: TextInputType.text,
                        height: 100,
                        controller: controller.noteController
                          ..text = controller.detailWaitOrder.value![0].note ==
                                  null
                              ? ''
                              : '${controller.detailWaitOrder.value![0].note}',
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tổng tiền',
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi').format(
                                controller.detailWaitOrder.value![0].total),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Thuế GTGT',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi').format(
                                controller.detailWaitOrder.value![0].tax),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi').format(
                                controller.detailWaitOrder.value![0].total! +
                                    controller.detailWaitOrder.value![0].tax!),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Liên hệ',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        child: Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Hủy',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                              content: Column(
                                children: const [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Xác nhận hủy đơn hàng?',
                                    style: TextStyle(
                                      color: colorText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Không')),
                                TextButton(
                                    onPressed: () {
                                      controller2.cancelOrder(
                                          id: controller
                                              .detailWaitOrder.value![0].id
                                              .toString());
                                      Get.back();
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Đồng ý',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )),
                              ]);
                        },
                      ),
                    ),
                  ],
                );
              }
            })),
      ),
    );
  }
}
