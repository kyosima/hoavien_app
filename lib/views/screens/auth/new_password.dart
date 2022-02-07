import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/resetpasword_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class NewPassword extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(
                    child: CustomTitleText(
                      title: 'Đặt lại mật khẩu',
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Obx(
                    () => Column(
                      children: [
                        CustomTextField(
                          maxLines: 1,
                          controller: controller.passWordController,
                          title: 'Mật khẩu mới',
                          inputType: TextInputType.text,
                          obscureText: controller.obscureTextPassword.value,
                          icon: controller.obscureTextPassword.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onPressed: () => controller.showpassword(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          maxLines: 1,
                          controller: controller.newPassWordController,
                          title: 'Nhập lại mật khẩu mới',
                          icon: controller.obscureTextNewPassword.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          inputType: TextInputType.text,
                          obscureText: controller.obscureTextNewPassword.value,
                          onPressed: () {
                            controller.shownewpassword();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: CustomButtonLoginPage(
                    title: 'Xác nhận',
                    onPressed: () {
                      controller.resetpassword();
                      // Get.toNamed('/login');
                    },
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
