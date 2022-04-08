import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constance.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Thông báo',
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height / 7,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/notificationdetail');
                    },
                    child: Card(
                        color: index % 2 == 0
                            ? const Color(0xffFDF2D7)
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_active,
                                size: 40,
                                color: primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      strutStyle:
                                          const StrutStyle(fontSize: 19.0),
                                      text: const TextSpan(
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 16,
                                          ),
                                          text:
                                              'Khuyến mại tri ân khách hàng nhân dịp năm mới cùng nhiều ưu đãi'),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          size: 18,
                                          color: secondaryColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '12/11/2021   -   09:65',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
