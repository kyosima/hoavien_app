import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/user/saler_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class SalerInfoPage extends StatelessWidget {
  final items = [
    'Nam',
    'Nữ',
  ];
  final SalerUserController controller = Get.put(SalerUserController());
  SalerInfoPage({Key? key}) : super(key: key);

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
        title: const CustomTitleText(
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
                          '${controller.infoUser.value?.userInfo?.fullname}',
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
                        ..text = "${controller.infoUser.value?.phone}"),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.dateController
                      ..text = controller.infoUser.value?.userInfo?.birthday ==
                              null
                          ? ''
                          : "${controller.infoUser.value?.userInfo?.birthday}",
                    maxLines: 1,
                    title: 'Ngày sinh',
                    inputType: TextInputType.datetime,
                    icon: Icons.date_range,
                    onPressed: () {
                      controller.setDate();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controller.sexMenuController
                      ..text = '${controller.infoUser.value?.userInfo?.gender}',
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
                  const SizedBox(
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
                            id: controller.infoUser.value?.id.toString(),
                            fullname: controller.fullNameController.text,
                            gender: controller.sexMenuController.text,
                            birthday: controller.dateController.text,
                          );
                        },
                        child: controller.loadingButton.value == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator())
                            : const Text(
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
