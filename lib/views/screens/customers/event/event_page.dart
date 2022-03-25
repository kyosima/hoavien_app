import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/event/event_controller.dart';
import 'package:hoavien_app/models/event/event_model.dart';
import 'package:hoavien_app/views/widgets/custom_add_gallery.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final controller = Get.put(EventController());
  CalendarFormat format = CalendarFormat.month;
  DateTime focusDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFDF2D7),
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: const CustomAddGalleryButton(),
          onPressed: () {
            Get.bottomSheet(
              SingleChildScrollView(
                child: Container(
                  height: 900,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Thông tin sự kiện',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          title: 'Tên sự kiện',
                          inputType: TextInputType.text,
                          controller: controller.eventController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: controller.timeController,
                          title: 'Thời gian',
                          inputType: TextInputType.datetime,
                          icon: Icons.timer_outlined,
                          onPressed: () {
                            controller.setEventTime();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextField(
                            title: 'Loại sự kiện',
                            inputType: TextInputType.text),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextField(
                            title: 'Nhóm', inputType: TextInputType.text),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextField(
                          title: 'Mô tả',
                          inputType: TextInputType.text,
                          maxLines: 2,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextField(
                            title: 'Địa điểm', inputType: TextInputType.text),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextField(
                          title: 'Thêm ghi chú',
                          inputType: TextInputType.text,
                          maxLines: 3,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                            child: CustomButtonLoginPage(
                          title: 'Lưu',
                          onPressed: () {
                            if (controller.eventController.text.isEmpty) {
                              return;
                            } else {
                              if (controller.selectedEvent![selectedDate] !=
                                  null) {
                                controller.selectedEvent![selectedDate]!.add(
                                    EventModel(
                                        title: controller.eventController.text,
                                        time: controller.timeController.text));
                              } else {
                                controller.selectedEvent![selectedDate] = [
                                  EventModel(
                                      title: controller.eventController.text,
                                      time: controller.timeController.text)
                                ];
                              }
                              controller.eventController.clear();
                              setState(() {});
                              Get.back();
                              return;
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              isDismissible: true,
              enableDrag: false,
            );
          },
        ),
        body: SingleChildScrollView(
          child: Container(
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
                          height: 360,
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
                                child: Obx(
                                  () => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Giờ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '${controller.hour.value} : ${controller.second.value}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'Kỷ hợi',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Ngày',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '${DateTime.now().day}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'Bính thìn',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Tháng',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '${DateTime.now().month}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'Tân sửu',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Năm',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: secondaryColor,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '${DateTime.now().year}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.redAccent,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
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
                                headerStyle: HeaderStyle(
                                  formatButtonVisible: true,
                                  formatButtonShowsNext: false,
                                  titleCentered: true,
                                  leftChevronVisible: true,
                                  rightChevronVisible: true,
                                  headerPadding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  formatButtonDecoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  formatButtonTextStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  titleTextStyle: const TextStyle(
                                      color: secondaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                locale: 'vi_VN',
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: selectedDate,
                                calendarFormat: format,
                                onFormatChanged: (CalendarFormat _format) {
                                  setState(() {
                                    format = _format;
                                  });
                                },
                                eventLoader: controller.getEventFromDate,
                                onDaySelected:
                                    (DateTime focusDay, DateTime selectedDay) {
                                  setState(() {
                                    focusDate = focusDay;
                                    selectedDate = selectedDay;
                                  });
                                  print(selectedDay);
                                  print(controller.getEventFromDate(
                                      DateTime.parse(
                                          '2022-03-22 00:00:00.000Z')));
                                },
                                selectedDayPredicate: (day) {
                                  return isSameDay(selectedDate, day);
                                },
                                calendarStyle: const CalendarStyle(
                                    todayDecoration: BoxDecoration(
                                      color: colorText,
                                      shape: BoxShape.circle,
                                    ),
                                    todayTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    )),
                              ),
                            ),
                          ],
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

                ...controller
                    .getEventFromDate(selectedDate)
                    .map((EventModel event) => Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Card(
                            shadowColor: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: secondaryColor, width: 3),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.title.toString(),
                                        style: const TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        event.time.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                // ListView.builder(
                //     padding: const EdgeInsets.only(left: 15, right: 15),
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: 5,
                //     itemBuilder: (BuildContext context, index) {
                //       return Card(
                //         shadowColor: Colors.red,
                //         child: Padding(
                //           padding: const EdgeInsets.all(15.0),
                //           child: Container(
                //             decoration: const BoxDecoration(
                //               border: Border(
                //                 left:
                //                     BorderSide(color: secondaryColor, width: 3),
                //               ),
                //             ),
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: const [
                //                   Text(
                //                     'Sinh nhật Linh Anh',
                //                     style: TextStyle(
                //                       color: secondaryColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 10,
                //                   ),
                //                   Text(
                //                     '18:00 - 22:00 / Bên Nội',
                //                     style: TextStyle(
                //                       color: Colors.grey,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     })
              ],
            ),
          ),
        ));
  }
}
