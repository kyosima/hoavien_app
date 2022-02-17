import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        title: CustomTitleText(
          title: 'Danh sách thành viên',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/thanhvien.jpg'),
                                        radius: 40,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '0356283687',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Họ tên: Trần Thị Hoa',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Quan hệ: Con gái',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
