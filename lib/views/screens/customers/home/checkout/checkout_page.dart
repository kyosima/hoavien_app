import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Thanh toán',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: SizedBox(
                      height: 50,
                      child: ButtonsTabBar(
                        backgroundColor: primaryColor,
                        unselectedBackgroundColor: Colors.white,
                        unselectedLabelStyle:
                            const TextStyle(color: secondaryColor),
                        labelStyle: const TextStyle(
                            letterSpacing: 0.7,
                            fontSize: 15,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            text: "Chờ thanh toán",
                          ),
                          Tab(
                            text: "Đến hạn",
                          ),
                          Tab(
                            text: "Quá hạn",
                          ),
                          Tab(
                            text: "Đã thanh toán",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Chờ thanh toán',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                '12/11/2021',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/taisanso.png',
                                                width: 100,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      strutStyle:
                                                          const StrutStyle(
                                                              fontSize: 19.0),
                                                      text: const TextSpan(
                                                          style: TextStyle(
                                                            color:
                                                                secondaryColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 19,
                                                          ),
                                                          text: 'PQ2.3-02-01'),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                          'Thuộc khu :',
                                                          style: TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Khu Phú Quý 2',
                                                          style: TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                          'Chủ sở hữu :',
                                                          style: TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Tần Văn Bá',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  secondaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          'Thanh toán đợt 2:',
                                                          style: TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            '2.000.000.000 đ',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    secondaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Get.toNamed(
                                                                '/checkoutdetail');
                                                          },
                                                          child: const Text(
                                                            'Xem chi tiết',
                                                            style: TextStyle(
                                                              color:
                                                                  secondaryColor,
                                                            ),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  primaryColor),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
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
                                ),
                              );
                            }),
                        const Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        const Center(
                          child: Icon(Icons.directions_bike),
                        ),
                        const Center(
                          child: Icon(Icons.directions_car),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
