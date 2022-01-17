import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_button_home_page.dart';
import 'package:hoavien_app/views/widgets/custom_service.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Container(
            height: 40.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  controller: null,
                  autofocus: false,
                  style: const TextStyle(fontSize: 16.0, color: secondaryColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Tìm kiếm',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 13.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ))),
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
              const Center(
                  child: Icon(
                Icons.notifications,
                size: 28,
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
              const Center(
                  child: Icon(
                Icons.shopping_basket,
                size: 28,
              ))
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  child: ImageSlideshow(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],

                    /// Called whenever the page in the center of the viewport changes.

                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.
                    autoPlayInterval: 7000,

                    /// Loops back to first slide.
                    isLoop: true,
                  ),
                ),
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
                        print('QR');
                      },
                    ),
                    CustomButtonHomePage(
                      tittle: 'Tài sản số',
                      icon: Icons.account_balance,
                      onTap: () {
                        print('QR');
                      },
                    ),
                    CustomButtonHomePage(
                      tittle: 'Thanh toán',
                      icon: Icons.credit_card,
                      onTap: () {
                        print('QR');
                      },
                    ),
                    CustomButtonHomePage(
                      tittle: 'TK phụ',
                      icon: Icons.group,
                      onTap: () {
                        print('QR');
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
                        SizedBox(
                          width: 5,
                        ),
                        CustomTitleText(title: 'ComBo HOT'),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
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
                        CustomTitleText(title: 'Dịch vụ an táng, cải táng'),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTitleText(title: 'Vật dụng thờ cúng'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
