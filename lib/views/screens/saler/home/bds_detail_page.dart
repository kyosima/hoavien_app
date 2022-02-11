import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class BdsDetailPage extends StatelessWidget {
  const BdsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        elevation: 1,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: CustomTitleText(
          title: 'Phú Quý 1',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff61C236),
                    border: Border.all(color: Colors.green, width: 8)),
                child: Image.asset(
                  'assets/images/map.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xffFD81FD),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Đã cọc/ giữ chổ',
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xff61C236),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Đã bán',
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xffFE7E00),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Đã sử dụng',
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xffF5C037),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Đang chọn',
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
