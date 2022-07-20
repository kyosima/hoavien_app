import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_history_cancel_detail_controller.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_history_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';

class CartHistoryDetailCancelPage extends StatelessWidget {
  final controller = Get.put(CartHistoryCancelDetailController());
  final controller2 = Get.put(CartHistoryController());
  CartHistoryDetailCancelPage({Key? key}) : super(key: key);

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
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
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
                            Text(
                              'Đã hủy',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  controller.orderDetail.value![0].createdAt!)),
                              style: TextStyle(
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
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.orderDetail.value![0].digitalAssetUse?.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controller.orderDetail.value![0].contact?.fullname}',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controller.orderDetail.value![0].contact?.phone}',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Ngày sử dụng : ${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.orderDetail.value![0].dateUse!))}',
                              style: TextStyle(
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
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .orderDetail.value![0].orderDetails!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
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
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '$baseURL${controller.orderDetail.value![0].orderDetails![index].content?.avatar}',
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.cover,
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
                                                  '${controller.orderDetail.value![0].orderDetails![index].content?.name}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: secondaryColor,
                                                  ),
                                                ),
                                                controller
                                                            .orderDetail
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
                                                            'Phân loại : ${controller.orderDetail.value![0].orderDetails![index].content?.variation?.name}  ',
                                                            style: TextStyle(
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
                                                      'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(controller.orderDetail.value![0].orderDetails![index].content?.price)}',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: secondaryColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'x ${controller.orderDetail.value![0].orderDetails![index].content?.quantity}',
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
                                        children: const [
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
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
                      padding: EdgeInsets.all(15.0),
                      child: CustomTextField(
                        controller: controller.noteController
                          ..text = controller.orderDetail.value![0].note == null
                              ? ''
                              : '${controller.orderDetail.value![0].note}',
                        title: 'Ghi chú',
                        inputType: TextInputType.text,
                        height: 100,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng tiền',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi')
                                .format(controller.orderDetail.value![0].total),
                            style: TextStyle(
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
                          Text(
                            'Thuế GTGT',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi')
                                .format(controller.orderDetail.value![0].tax),
                            style: TextStyle(
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
                          Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'vi').format(
                                controller.orderDetail.value![0].total! +
                                    controller.orderDetail.value![0].tax!),
                            style: TextStyle(
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
                              'Đặt lại',
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
                                    'Xác nhận đặt lại đơn hàng?',
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
                                      controller2.reOrder(
                                          id: controller
                                              .orderDetail.value![0].id
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
