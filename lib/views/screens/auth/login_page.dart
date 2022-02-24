import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/login_controller.dart';
import 'package:hoavien_app/service/api_service.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

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
            color: Colors.brown,
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
                  SizedBox(
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
                    () => Form(
                      key: _formKey,
                      child: Column(
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
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "Nhớ mật khẩu",
                            style: TextStyle(fontSize: 15),
                          ),
                          value: controller.isChecked.value,
                          onChanged: (value) {
                            controller.check();
                          },
                        ),
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
                      controller.loginafter();
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
