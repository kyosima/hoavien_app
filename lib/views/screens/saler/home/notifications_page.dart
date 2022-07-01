import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

import '../../../../constance.dart';

class SalerNotificationsPage extends StatelessWidget {
  const SalerNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Thông báo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
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
    );
  }
}
