import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/statistical/statistical_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class StatisticalPage extends StatelessWidget {
  final StatisticalController controller = Get.put(StatisticalController());
  final month = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const CustomTitleText(
          title: 'Thống kê',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Theo ngày'),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      autofocus: false,
                      readOnly: true,
                      controller: controller.pickStartDateController,
                      showCursor: false,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Từ ngày',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onTap: () {
                        controller.pickStartDate();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      autofocus: false,
                      controller: controller.pickEndDateController,
                      showCursor: false,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Đến ngày',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onTap: () {
                        controller.pickEndDate();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Theo tháng'),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      showCursor: false,
                      controller: controller.monthController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: month[0],
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
                            controller.monthController.text = value;
                            print(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return month
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem(
                                  child: Text(
                                    value,
                                    style: const TextStyle(
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
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/tongdoanhthu');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: secondaryColor,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Tổng doanh thu (tạm tính)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '11.200.000.000 đ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Danh sách giao dịch',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: colorText,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: secondaryColor,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Doanh thu đã ký hợp đồng',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '11.200.000.000 đ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Danh sách giao dịch',
                            style: TextStyle(
                                fontSize: 16,
                                color: colorText,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: secondaryColor,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Doanh thu đã cọc',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '11.200.000.000 đ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Danh sách giao dịch',
                            style: TextStyle(
                                fontSize: 16,
                                color: colorText,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
