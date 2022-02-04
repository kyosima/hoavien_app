import 'package:flutter/material.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

import '../../../../constance.dart';
import 'package:get/get.dart';

class DichvuAntangCaiTangPage extends StatelessWidget {
  const DichvuAntangCaiTangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        title: CustomTitleText(
          title: 'Dịch vụ an táng, cải táng',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView.builder(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('/combohotdetail');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/combohot.png',
                            height: double.infinity,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      strutStyle: StrutStyle(fontSize: 19.0),
                                      text: TextSpan(
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                          text: 'Cải táng hộc lưu tro HVBA'),
                                    ),
                                    Image.asset('assets/images/hot.png')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'đ 500.000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  strutStyle: StrutStyle(fontSize: 19.0),
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontSize: 15,
                                      ),
                                      text:
                                          'Dịch vụ chất lượng được ung cấp bởi Hoa Viên Bình A'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
