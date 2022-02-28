import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/forget_password_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class ForgotPassword extends GetView<ForgetPasswordController> {
  const ForgotPassword({Key? key}) : super(key: key);

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
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 144,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: CustomTitleText(
                      title: 'Quên mật khẩu',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    'Điền thông tin số điện thoại để nhận mã OTP',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      CustomTextField(
                        maxLines: 1,
                        controller: controller.phoneNumber,
                        title: 'Số điện thoại',
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Center(
                      child: CustomButtonLoginPage(
                    title: 'Tiếp tục',
                    onPressed: () {
                      controller.forgetpassword();
                    },
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
