import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/user/info_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class InfoUserPage extends StatelessWidget {
  final InfoUserController controller = Get.put(InfoUserController());
  var items = [
    'Nam',
    'Nữ',
  ];

  InfoUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: CustomTitleText(
          title: 'Thông tin cá nhân',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 45,
                        ),
                      ),
                      Center(
                          child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: secondaryColor,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    title: 'Họ và tên',
                    inputType: TextInputType.text,
                    controller: controller.fullNameController
                      ..text =
                          '${controller.informationUser.value?.userInfo?.fullname}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      enable: false,
                      maxLines: 1,
                      title: 'Số điện thoại đăng ký tài khoản',
                      inputType: TextInputType.number,
                      controller: controller.phoneController
                        ..text = "${controller.informationUser.value?.phone}"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.dateController
                      ..text =
                          '${controller.informationUser.value?.userInfo?.birthday}',
                    maxLines: 1,
                    title: 'Ngày sinh',
                    inputType: TextInputType.datetime,
                    icon: Icons.date_range,
                    onPressed: () {
                      controller.setDate();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controller.sexMenuController
                      ..text =
                          '${controller.informationUser.value?.userInfo?.gender}',
                    decoration: InputDecoration(
                      labelText: 'Giới tính',
                      labelStyle: const TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.5, color: secondaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          controller.sexMenuController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                                child: Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: primaryColor, width: 1.0)),
                      child: TextButton(
                        onPressed: () {
                          controller.updateInfo(
                            id: controller.informationUser.value?.id.toString(),
                            fullname: controller.fullNameController.text,
                            gender: controller.sexMenuController.text,
                            birthday: controller.dateController.text,
                          );
                        },
                        child: const Text(
                          'Lưu lại',
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
