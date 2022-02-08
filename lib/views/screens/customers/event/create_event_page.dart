import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/event/create_event_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class CreateEventPage extends GetView<CreateEventController> {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        elevation: 0,
        title: CustomTitleText(
          title: 'Tạo sự kiện mới',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thông tin sự kiện',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    title: 'Tên sự kiện', inputType: TextInputType.text),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.timeController,
                        title: 'Thời gian',
                        inputType: TextInputType.datetime,
                        icon: Icons.timer_outlined,
                        onPressed: () {
                          controller.setEventTime();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextField(
                        title: 'Ngày',
                        controller: controller.dateController,
                        inputType: TextInputType.datetime,
                        icon: Icons.calendar_today,
                        onPressed: () {
                          controller.setEventDay();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    title: 'Loại sự kiện', inputType: TextInputType.text),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(title: 'Nhóm', inputType: TextInputType.text),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  title: 'Mô tả',
                  inputType: TextInputType.text,
                  maxLines: 2,
                  height: 80,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    title: 'Địa điểm', inputType: TextInputType.text),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  title: 'Thêm ghi chú',
                  inputType: TextInputType.text,
                  maxLines: 3,
                  height: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(child: CustomButtonLoginPage(title: 'Lưu')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
