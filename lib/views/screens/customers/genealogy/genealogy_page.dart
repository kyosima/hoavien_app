import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class GenealogyPage extends StatelessWidget {
  const GenealogyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CustomTitleText(
          title: 'Gia phả',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/taogiapha');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: secondaryColor,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: colorText,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Tạo gia phả',
                        style: TextStyle(color: colorText),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Họ Trần',
                        style: TextStyle(
                            fontSize: 16,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.people,
                            color: colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Số thành viên: 3',
                            style: TextStyle(
                              color: colorText,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Ngày tạo: 04/01/2021',
                            style: TextStyle(
                              color: colorText,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Địa chỉ: 134 Cổ Am',
                            style: TextStyle(
                              color: colorText,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.person,
                            color: colorText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Người tạo: Trần Hồng',
                            style: TextStyle(
                              color: colorText,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFBE5AF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 16,
                                    ),
                                    Text('Xóa'),
                                  ],
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 40,
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 16,
                                    ),
                                    Text('Sửa thông tin'),
                                  ],
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff865841),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 40,
                            child: TextButton(
                                onPressed: () {
                                  Get.toNamed('/chitietgiapha');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.bubble_chart,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Cây gia phả',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
