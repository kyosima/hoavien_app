import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/second_account/second_account_controller.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AddSecondAccountPage extends StatelessWidget {
  SecondAccountController controller = Get.put(SecondAccountController());
  UserModel? user;
  AddSecondAccountPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                    maxLines: 1,
                    title: 'Họ và tên',
                    inputType: TextInputType.text,
                    controller: controller.fullNameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    title: 'Quan hệ với bạn',
                    inputType: TextInputType.text,
                    controller: controller.relationshipController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    controller: controller.phoneController,
                    title: 'Số điện thoại đăng ký tài khoản',
                    inputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    controller: controller.passwordController,
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
                    maxLines: 1,
                    controller: controller.password_confirmationController,
                    title: 'Xác nhận Mật khẩu',
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
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
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
                          controller.addAccount(
                              fullname: controller.fullNameController.text,
                              relationship:
                                  controller.relationshipController.text,
                              phone: controller.phoneController.text,
                              password: controller.passwordController.text,
                              password_confirmation: controller
                                  .password_confirmationController.text,
                              addedby: '${user?.data?.id}');
                        },
                        child: controller.buttonLoading.value == true
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator())
                            : Text(
                                'Thêm tài khoản',
                                style: const TextStyle(
                                    color: secondaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
