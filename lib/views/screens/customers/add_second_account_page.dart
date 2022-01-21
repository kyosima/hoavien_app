import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/add_second_account_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AddSecondAccountPage extends GetView<AddSecondAccountController> {
  const AddSecondAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: secondaryColor),
        title: CustomTitleText(
          title: 'Thêm tài khoản phụ',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 45,
                        ),
                      ),
                      Center(
                          child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: secondaryColor,
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Họ và tên',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Quan hệ với bạn',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Số điện thoại đăng ký tài khoản',
                    inputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Mật khẩu',
                    inputType: TextInputType.text,
                    obscureText: !controller.obscureTextPassword.value,
                    icon: controller.obscureTextPassword.value == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onPressed: () {
                      controller.seePassword();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Mật khẩu',
                    inputType: TextInputType.text,
                    obscureText: !controller.obscureTextConfirmPassword.value,
                    icon: controller.obscureTextConfirmPassword.value == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onPressed: () {
                      controller.seeConfirmPassword();
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Các tài sản số được quyền xem',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/picktaisanso');
                        },
                        child: Row(
                          children: [
                            Text(
                              'Chọn',
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButtonLoginPage(title: 'Xong'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
