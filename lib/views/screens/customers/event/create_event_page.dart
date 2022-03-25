import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/event/event_controller.dart';
import 'package:hoavien_app/models/event/event_model.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class CreateEventPage extends StatefulWidget {
  CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final controller = Get.put(EventController());

  final DateTime selectedDate = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        title: const CustomTitleText(
          title: 'Tạo sự kiện mới',
        ),
      ),
      body: SingleChildScrollView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextField(
                      // controller: .timeController,
                      title: 'Thời gian',
                      inputType: TextInputType.datetime,
                      icon: Icons.timer_outlined,
                      onPressed: () {
                        // controller.setEventTime();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      title: 'Ngày',
                      // controller: controller.dateController,
                      inputType: TextInputType.datetime,
                      icon: Icons.calendar_today,
                      onPressed: () {
                        // controller.setEventDay();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                  title: 'Loại sự kiện', inputType: TextInputType.text),
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
                    print('1');
                    return;
                  } else {
                    if (controller.selectedEvent![selectedDate] != null) {
                      controller.selectedEvent![selectedDate]!.add(EventModel(
                          title: controller.eventController.text,
                          time: controller.timeController.text));
                      print('3');
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
    );
  }
}
