import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_add_gallery.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:table_calendar/table_calendar.dart';

class SecondAccountEventPage extends StatelessWidget {
  const SecondAccountEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: const CustomAddGalleryButton(),
          onPressed: () {
            Get.toNamed('/taosukien');
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffFDF2D7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          color: const Color(0xffFFC950),
                        ),
                        Image.asset(
                          'assets/images/eventbackground.png',
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 400,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFC950),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        )
                      ],
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      top: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTitleText(title: 'Sự kiện'),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Âm lịch',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffFDF2D7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            'Giờ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '10:45',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Kỷ hợi',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Ngày',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Bính thìn',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Tháng',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '12',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Tân sửu',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Năm',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '2021',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Nhâm dần',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Dương lịch',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffFDF2D7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TableCalendar(
                                  firstDay: DateTime.utc(2010, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  focusedDay: DateTime.now(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Color(0xffB71F45),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Sự kiện hôm nay',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffB71F45)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          shadowColor: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: secondaryColor, width: 3),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Sinh nhật Linh Anh',
                                        style: TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '18:00 - 22:00 / Bên Nội',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
