import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/login_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class LoginPage extends GetView<LoginController> {
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
                    children: [
                      CustomTextField(
                        controller: controller.phoneNumber,
                        title: 'Số điện thoại',
                        hintText: 'Số điện thoại',
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        controller: controller.passWord,
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
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (value) {
                                controller.check();
                                if (value == true) {
                                  var savePassword = controller.passWord.text;
                                  print(savePassword);
                                }
                              },
                            ),
                          ),
                          const Text(
                            "Nhớ mật khẩu",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
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
                            controller.login();
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
