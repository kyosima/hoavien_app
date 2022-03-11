import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/second_account/second_account_controller.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSecondAccountPage extends StatelessWidget {
  final SecondAccountController controller = Get.put(SecondAccountController());
  AddSecondAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: secondaryColor),
        title: const CustomTitleText(
          title: 'Thêm tài khoản phụ',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 45,
                      ),
                    ),
                    Center(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: secondaryColor,
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  title: 'Họ và tên',
                  inputType: TextInputType.text,
                  controller: controller.fullNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  title: 'Quan hệ với bạn',
                  inputType: TextInputType.text,
                  controller: controller.relationshipController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  controller: controller.phoneController,
                  title: 'Số điện thoại đăng ký tài khoản',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  controller: controller.passwordController,
                  title: 'Mật khẩu',
                  inputType: TextInputType.text,
                  obscureText: !controller.obscureTextPassword.value,
                  icon: controller.obscureTextPassword.value == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.seePassword();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  controller: controller.password_confirmationController,
                  title: 'Xác nhận Mật khẩu',
                  inputType: TextInputType.text,
                  obscureText: !controller.obscureTextConfirmPassword.value,
                  icon: controller.obscureTextConfirmPassword.value == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.seeConfirmPassword();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Các tài sản số được quyền xem',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/picktaisanso');
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Chọn',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
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
                        controller.addAccount(
                            fullname: controller.fullNameController.text,
                            relationship:
                                controller.relationshipController.text,
                            phone: controller.phoneController.text,
                            password: controller.passwordController.text,
                            password_confirmation:
                                controller.password_confirmationController.text,
                            addedby: prefs.getInt('id').toString());
                      },
                      child: controller.buttonLoading.value == true
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : const Text(
                              'Thêm tài khoản',
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
