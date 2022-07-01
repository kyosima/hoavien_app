import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/transaction/transaction_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const CustomTitleText(
          title: 'Giao dịch của tôi',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: secondaryColor,
            ),
          )
        ],
      ),
      body: Container(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                unselectedDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                tabs: const [
                  Tab(
                    text: "Giữ chổ",
                  ),
                  Tab(
                    text: "Đã cọc",
                  ),
                  Tab(
                    text: "Đã ký hợp đồng",
                  ),
                  Tab(
                    text: "Đã hủy",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed('/chitietgiaodich');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/taisanso.png',
                                        fit: BoxFit.cover,
                                        height: 90,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Phú Quý 2.3-01-02',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Thuộc khu : Phú Quý 2',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: colorText,
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Giữ chổ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffFD81FD),
                                                fontWeight: FontWeight.w600,
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
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
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/taisanso.png',
                                      fit: BoxFit.cover,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Phú Quý 2.3-01-02',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Thuộc khu : Phú Quý 2',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: colorText,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Đã cọc',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffFD81FD),
                                              fontWeight: FontWeight.w600,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
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
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/taisanso.png',
                                      fit: BoxFit.cover,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Phú Quý 2.3-01-02',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Thuộc khu : Phú Quý 2',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: colorText,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Đã ký hợp đồng',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff07BE02),
                                              fontWeight: FontWeight.w600,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
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
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/taisanso.png',
                                      fit: BoxFit.cover,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Phú Quý 2.3-01-02',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Thuộc khu : Phú Quý 2',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: colorText,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Đã hủy',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
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
