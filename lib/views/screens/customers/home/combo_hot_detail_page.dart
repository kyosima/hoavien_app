import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_bottom_bar.dart';
import 'package:hoavien_app/views/widgets/custom_service.dart';
import 'package:hoavien_app/views/widgets/custom_share_button.dart';
import 'package:share_plus/share_plus.dart';

class ComboHotDetailPage extends StatelessWidget {
  const ComboHotDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomBar(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
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
              const Center(
                  child: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 25,
              ))
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CustomShareButton(
            onTap: () {
              Share.share('123');
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 380,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/combodetail.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 140,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/hot.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Combo cải táng 1',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4.5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 23,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text('Đã bán : 1.5k')
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '500.000đ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin chi tiết',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus arcu, quis mi magna dui molestie scelerisque nam euismod. Consequat nullam gravida pellentesque quis faucibus. Nunc non gravida eget ultrices. Cras nunc euismod at urna ligula.'''),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus arcu, quis mi magna dui molestie scelerisque nam euismod. Consequat nullam gravida pellentesque quis faucibus. Nunc non gravida eget ultrices. Cras nunc euismod at urna ligula.'''),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus arcu, quis mi magna dui molestie scelerisque nam euismod. Consequat nullam gravida pellentesque quis faucibus. Nunc non gravida eget ultrices. Cras nunc euismod at urna ligula.'''),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dịch vụ khác',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
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
