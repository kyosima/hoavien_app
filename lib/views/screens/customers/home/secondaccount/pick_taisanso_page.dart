import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class PickTaisanso extends StatelessWidget {
  const PickTaisanso({Key? key}) : super(key: key);

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
          title: 'Chọn tài khoản số',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('/taisansodetail');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/taisanso.png',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  strutStyle: StrutStyle(fontSize: 19.0),
                                  text: const TextSpan(
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                      ),
                                      text: 'PQ2.3-02-01'),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Thuộc khu :',
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Khu Phú Quý 2',
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Chủ sở hữu :',
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Tần Văn Bá',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 7,
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
