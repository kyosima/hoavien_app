import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/user/change_password_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class ChangePasswordPage extends GetView<ChangePasswordUserController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        title: CustomTitleText(
          title: 'Thay đổi mật khẩu',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.passWordController,
                  title: 'Mật khẩu',
                  inputType: TextInputType.text,
                  obscureText: controller.obsPassWord.value,
                  maxLines: 1,
                  icon: controller.obsPassWord.value == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.showPassword();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  title: 'Mật khẩu mới',
                  inputType: TextInputType.text,
                  obscureText: controller.obsNewPassWord.value,
                  maxLines: 1,
                  icon: controller.obsNewPassWord.value == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.showNewPassword();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  title: 'Nhập lại mật khẩu mới',
                  inputType: TextInputType.text,
                  obscureText: controller.obsConfirmNewPassWord.value,
                  maxLines: 1,
                  icon: controller.obsConfirmNewPassWord.value == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.showConfirmNewPassword();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButtonLoginPage(title: 'Đổi mật khẩu'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
