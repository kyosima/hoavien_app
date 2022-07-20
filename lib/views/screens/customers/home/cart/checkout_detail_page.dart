import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/checkout_detail_controller.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutDetailPage extends StatelessWidget {
  final controller = Get.put(CheckoutDetailController());
  final Data cartInfo = Get.arguments;

  CheckoutDetailPage({Key? key}) : super(key: key);

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
                Text(
                  'Thành tiền : ${NumberFormat.currency(locale: 'vi').format(cartInfo.total! + cartInfo.total! * 0.1)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (controller.taisansoSelectId.value == 0) {
                      Get.defaultDialog(
                          content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 60.0,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Image.asset(
                                'assets/images/error.gif',
                                width: 55,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text(
                              '''Vui lòng lựa chọn Lô sử dụng!''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ));
                    } else {
                      final prefs = await SharedPreferences.getInstance();
                      final userId = prefs.getInt('id').toString();
                      controller.createOrder(
                        userId: userId,
                        phoneNumber: controller.phone.value,
                        fullName: controller.fullName.value,
                        itemId: controller.productsId,
                        taisansoId:
                            controller.taisansoSelectId.value.toString(),
                        note: controller.noteController.text,
                        dateUse: controller.dateTimeController.text,
                      );
                      Get.back();
                      Get.back();
                    }
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
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Thông tin đặt hàng',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            controller.taisansoSelectName.value == ''
                                ? 'Lựa chọn lô sử dụng'
                                : '${controller.taisansoSelectName}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(
                              '/selectcarttaisanso',
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: secondaryColor,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    Obx(() => Text('${controller.fullName}')),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => Text('${controller.phone}')),
                  ],
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartInfo.items!.length,
                itemBuilder: (context, index) {
                  controller.productsId.add(cartInfo.items![index].id);
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '$baseURL${cartInfo.items![index].content?.avatar}',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cartInfo.items![index].content?.name}',
                                      style: const TextStyle(
                                          color: secondaryColor, fontSize: 16),
                                    ),
                                    cartInfo.items![index].content?.variation ==
                                            null
                                        ? Container()
                                        : Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              Text(
                                                  'Phân loại : ${cartInfo.items![index].content?.variation?.name}'),
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
                                          NumberFormat.currency(locale: 'vi')
                                              .format(cartInfo.items![index]
                                                  .content?.price),
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          'x ${cartInfo.items![index].content?.quantity}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '''Hình thức thanh toán
( Nhân viên của chúng tôi sẽ gọi điện và cung cấp thông tin thanh toán cho quý khách hàng ) ''',
                  style: TextStyle(
                    color: colorText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Chọn ngày sử dụng',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_month),
                            onPressed: () {
                              controller.setDate();
                            },
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                        ),
                        controller: controller.dateTimeController
                          ..text = controller.dateTimeController.text == ''
                              ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                              : controller.dateTimeController.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15),
              child: Text(
                'Ghi chú',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: InputBorder.none,
                    hintText: 'Nhập ghi chú',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                  controller: controller.noteController),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng tiền',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi')
                        .format(cartInfo.total)
                        .toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Thuế VAT',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi')
                        .format(cartInfo.total! * 0.1)
                        .toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
