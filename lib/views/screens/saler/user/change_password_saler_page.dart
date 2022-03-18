import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/user/change_password_saler_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalerChangePasswordPage extends StatelessWidget {
  final controller = Get.put(ChangePasswordSalerController());
  SalerChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
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
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.newPassWordController,
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
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.confirmNewPassWordController,
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
                const SizedBox(
                  height: 50,
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
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        final id = prefs.getInt('id').toString();
                        controller.changePassword(
                            id: id,
                            password: controller.passWordController.text,
                            newPassword: controller.newPassWordController.text,
                            confirmNewPassword:
                                controller.confirmNewPassWordController.text);
                      },
                      child: controller.isLoading.value == true
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : const Text(
                              'Đổi mật khẩu ',
                              style: TextStyle(
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
    );
  }
}
