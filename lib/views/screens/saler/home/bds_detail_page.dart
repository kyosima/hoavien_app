import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/home/bds_detail_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class BdsDetailPage extends GetView<BdsDetailsController> {
  var items = [
    'Phú Quý 1.1',
    'Phú Quý 1.2',
    'Phú Quý 1.3',
    'Phú Quý 1.14',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: CustomTitleText(
          title: 'Phú Quý 1',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(50, 30),
                        alignment: Alignment.centerLeft),
                    onPressed: () {
                      controller.showTableDetail();
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: colorText,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bảng thống kê',
                              style: TextStyle(
                                color: secondaryColor,
                              ),
                            ),
                            Icon(controller.showTable == true
                                ? Icons.keyboard_arrow_down
                                : Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  controller.showTable == true
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/bang.png'),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 160,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      showCursor: false,
                      controller: controller.arenaController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: items[0],
                        hintStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        labelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide:
                              const BorderSide(width: 1, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: secondaryColor,
                          ),
                          onSelected: (String value) {
                            controller.arenaController.text = value;
                            print(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return items
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  value: value);
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 6,
                    children: List.generate(
                        20,
                        (index) => InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.info,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Thông tin lô',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
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
                                              Text(
                                                'Tên lô',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                'PQ2.3-01-02',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontSize: 14,
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
                                              Text(
                                                'Khu',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Phú Quý',
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                              Text(
                                                'Kích thước',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                '7.2 x 9',
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                              Text(
                                                'Diện tích',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                '64.5 m2',
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                              Text(
                                                'Giá bán',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                '102.000.000',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
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
                                              Text(
                                                'Giá CSBQ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                '25.000.000',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
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
                                              Text(
                                                'Tổng giá',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: secondaryColor,
                                                ),
                                              ),
                                              Text(
                                                '127.000.000',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Khi bạn giữ chỗ người khác sẽ không thể đặt tiếp',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                  Get.defaultDialog(
                                                      content: Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons.check_circle,
                                                          size: 70,
                                                          color: Colors.green,
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Giữ chổ thành công',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                secondaryColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Hệ thống đã xác nhận thông tin giữ chổ của bạn',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: colorText,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                  child: Text(
                                                                    'OK',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          secondaryColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ));
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: secondaryColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                        child: Text('Giữ chổ')),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                  Get.defaultDialog(
                                                      content: Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons.check_circle,
                                                          size: 70,
                                                          color: Colors.green,
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Đặt cọc thành công',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                secondaryColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Hệ thống sẽ kiểm tra tiền đặt cọc đối với lô bạn đã đặt cọc và xác nhận thông tin.',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: colorText,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                  child: Text(
                                                                    'OK',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          secondaryColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ));
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: primaryColor,
                                                      ),
                                                      color: primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                        child: Text('Đặt cọc')),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  barrierDismissible: true,
                                  radius: 10.0,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'H1.$index',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: index % 5 == 0
                                            ? secondaryColor
                                            : Colors.white),
                                    color: index % 5 == 0
                                        ? Colors.white
                                        : index % 5 == 1
                                            ? Color(0xffFD81FD)
                                            : index % 5 == 2
                                                ? Color(0xff61C236)
                                                : Color(0xffFE7E00),
                                  ),
                                  height: 100,
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
