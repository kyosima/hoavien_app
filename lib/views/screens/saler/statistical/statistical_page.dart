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
        title: CustomTitleText(
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
                  Text('Theo ngày'),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      readOnly: true,
                      controller: controller.pickStartDateController,
                      showCursor: false,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 5),
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
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.pickStartDate();
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      controller: controller.pickEndDateController,
                      showCursor: false,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 5),
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
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.5, color: colorText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.pickEndDate();
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Theo tháng'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      showCursor: false,
                      controller: controller.monthController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
