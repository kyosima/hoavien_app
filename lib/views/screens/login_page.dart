import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/screens/forgot_password_page.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Text(
          '''Liên hệ với chúng tôi nếu bạn chưa có tài khoản
        Hotline: 1900776589''',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
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
                      title: 'ĐĂNG NHẬP',
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: const [
                      CustomTextField(
                        title: 'Số điện thoại',
                        hintText: 'Số điện thoại',
                        inputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        title: 'Password',
                        hintText: 'Password',
                        obscureText: true,
                        inputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nhớ mật khẩu",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/forgotpassword');
                          },
                          child: const Text(
                            'Quên mật khẩu ?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: CustomButtonLoginPage(
                    title: 'Đăng nhập',
                    onPressed: () {
                      Get.snackbar(
                        "Đăng nhập thành công",
                        "Chúc mừng bạn đã đăng nhập thành công",
                        icon: Icon(Icons.check_circle, color: primaryColor),
                        snackPosition: SnackPosition.TOP,
                      );
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
