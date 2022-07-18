import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/cart/cart_controller.dart';
import 'package:hoavien_app/models/home/cart/cart_model.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';

class EditProductCartPage extends StatefulWidget {
  const EditProductCartPage({Key? key}) : super(key: key);

  @override
  State<EditProductCartPage> createState() => _EditProductCartPageState();
}

class _EditProductCartPageState extends State<EditProductCartPage> {
  final controller = Get.put(CartController());
  final Items productCart = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Sửa sản phẩm',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: '$baseURL${productCart.content?.avatar}',
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productCart.content!.name.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: colorText,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          productCart.content!.variation == null
                              ? Container()
                              : Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      productCart.content!.variation!.name
                                          .toString(),
                                      style: const TextStyle(
                                        color: secondaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Text(
                          'Đơn giá : ${NumberFormat.currency(locale: 'vi').format(productCart.content!.price!)}'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Thành tiền : '),
                          Text(
                            NumberFormat.currency(locale: 'vi').format(
                                productCart.content!.price! *
                                    productCart.content!.quantity!.toInt()),
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  productCart.content!.quantity =
                                      productCart.content!.quantity! - 1;
                                  if (productCart.content!.quantity! < 0) {
                                    productCart.content!.quantity = 0;
                                  }
                                });
                              },
                              child: Stack(
                                children: const [
                                  CircleAvatar(
                                    radius: 17,
                                    backgroundColor: secondaryColor,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Color(0xffE6D4CB),
                                      foregroundColor: secondaryColor,
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
                            Text('${max(0, productCart.content!.quantity!)}'),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  productCart.content!.quantity =
                                      productCart.content!.quantity! + 1;
                                });
                              },
                              child: Stack(
                                children: const [
                                  CircleAvatar(
                                    radius: 17,
                                    backgroundColor: secondaryColor,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Color(0xffE6D4CB),
                                      foregroundColor: secondaryColor,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                    color: productCart.content!.quantity! <= 0
                        ? Colors.red
                        : primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: primaryColor, width: 1.0)),
                child: TextButton(
                  onPressed: () async {
                    if (productCart.content!.quantity! <= 0) {
                      controller.deleteProductCart(
                        id: productCart.id.toString(),
                      );
                      Get.back();
                    } else {
                      controller.updateProductcart(
                        id: productCart.id.toString(),
                        quantity: productCart.content!.quantity.toString(),
                      );
                      Get.back();
                    }
                  },
                  child: Text(
                    productCart.content!.quantity! <= 0
                        ? 'Xóa sản phẩm'
                        : 'Cập nhật',
                    style: TextStyle(
                        color: productCart.content!.quantity! <= 0
                            ? Colors.white
                            : secondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
