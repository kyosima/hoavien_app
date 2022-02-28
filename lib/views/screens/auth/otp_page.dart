import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const CustomTitleText(
                    title: 'Nhập mã OTP',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Mã OTP sẽ được gửi đến số điện thoại của bạn',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      if (pin == '123456') {
                        Get.toNamed('/newpassword');
                      } else {
                        Get.snackbar(
                            'OTP không chính xác!', 'Vui lòng nhập lại OTP');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: CustomButtonLoginPage(
                    title: 'Xác nhận',
                    onPressed: () {
                      Get.back();
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
