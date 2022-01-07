import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class NewPassword extends StatelessWidget {
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
                  Column(
                    children: const [
                      CustomTextField(
                        title: 'Mật khẩu mới',
                        hintText: '',
                        inputType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        title: 'Nhập lại mật khẩu mới',
                        hintText: '',
                        inputType: TextInputType.text,
                        obscureText: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: CustomButtonLoginPage(
                    title: 'Xác nhận',
                    onPressed: () {
                      Get.toNamed('/login');
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
