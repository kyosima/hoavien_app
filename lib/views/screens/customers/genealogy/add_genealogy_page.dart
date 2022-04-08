import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/genealogy/add_genealogy_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AddGenealogyPage extends GetView<AddGenealogyController> {
  const AddGenealogyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Tạo gia phả',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thông tin gia phả',
                  style: const TextStyle(
                    color: secondaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.nameGenealogyController,
                  maxLines: 1,
                  title: 'Tên gia phả',
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.addressController,
                  maxLines: 1,
                  title: 'Địa chỉ',
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.historyGenealogyController,
                  hintText: 'Nhập nội dung',
                  title: 'Gia sử dòng họ',
                  inputType: TextInputType.text,
                  maxLines: 4,
                  height: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Thủy tổ/ Thế hệ thứ nhất',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.nameGen1Controller,
                  title: 'Họ và tên',
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.secondNameGen1Controller,
                  title: 'Biệt danh/Tên gợi nhớ',
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.birthDayController,
                  title: 'Ngày sinh',
                  inputType: TextInputType.datetime,
                  icon: Icons.calendar_today,
                  onPressed: () {
                    controller.setBirthday();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.deathDayController,
                  title: 'Ngày mất',
                  inputType: TextInputType.datetime,
                  icon: Icons.calendar_today,
                  onPressed: () {
                    controller.setDeathday();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: controller.deathLocationController,
                  hintText: 'Nhập địa chỉ nơi an táng',
                  title: 'Mộ táng',
                  inputType: TextInputType.text,
                  maxLines: 4,
                  height: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: CustomButtonLoginPage(
                  title: 'Tạp gia phả',
                  onPressed: () {
                    controller.addGenealogy();
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
