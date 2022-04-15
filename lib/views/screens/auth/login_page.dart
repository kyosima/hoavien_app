import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/auth/auth_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(AuthController());
  LoginPage({Key? key}) : super(key: key);

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
                      title: 'Đăng nhập',
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
                          controller: controller.phoneNumber,
                          title: 'Số điện thoại',
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          maxLines: 1,
                          controller: controller.passWord,
                          title: 'Mật khẩu',
                          icon: controller.obscureText.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: controller.obscureText.value,
                          inputType: TextInputType.text,
                          onPressed: () {
                            controller.checkpass();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      child: Obx(
                    () => SizedBox(
                      width: 250,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: primaryColor, width: 1.0)),
                        child: TextButton(
                          onPressed: () {
                            controller.submit();
                          },
                          child: controller.loginProcess.value == true
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator())
                              : const Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '''Liên hệ với chúng tôi nếu bạn chưa có tài khoản
        Hotline: 1900776589''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15,
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
