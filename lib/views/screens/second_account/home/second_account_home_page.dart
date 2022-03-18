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
              SizedBox(
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
                      CustomTitleText(title: 'ComBo HOT'),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 289,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomService(
                        onTap: () {
                          print('COMBO HOT');
                        },
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    const CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 289,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomService(
                        onTap: () {
                          print('COMBO HOT');
                        },
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: 289,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomService(
                        onTap: () {
                          print('COMBO HOT');
                        },
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                    CustomService(
                        image: 'assets/images/dichvu.png',
                        title: 'Combo gói dịch vụ HOT',
                        price: 'đ 500.000',
                        priceSale: 'đ 500.000',
                        info:
                            'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình An'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitleText(title: 'Vật dụng thờ cúng'),
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
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isLoadingProduct.value) {
                  return Container();
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
