import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/home/second_account/second_account_controller.dart';
import 'package:hoavien_app/models/home/second_account/list_second_account_model.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditSecondAccountPage extends StatelessWidget {
  final SecondAccountController controller = Get.put(SecondAccountController());
  final Data userInfo = Get.arguments;
  EditSecondAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: secondaryColor),
        title: const CustomTitleText(
          title: 'Chỉnh sửa khoản phụ',
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
                  height: 25,
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
                  controller: controller.editFullNameController
                    ..text = "${userInfo.userInfo?.fullname}",
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  title: 'Quan hệ với bạn',
                  inputType: TextInputType.text,
                  controller: controller.editRelationshipController
                    ..text = '${userInfo.userInfo?.relationship}',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  maxLines: 1,
                  title: 'Số điện thoại đăng ký tài khoản',
                  inputType: TextInputType.number,
                  controller: controller.editPhoneController
                    ..text = "${userInfo.phone}",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.editPasswordController,
                  maxLines: 1,
                  title: 'Mật khẩu',
                  inputType: TextInputType.text,
                  obscureText: !controller.obsEditPassword.value,
                  icon: controller.obsEditPassword.value == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.seeEditPassword();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.editConfirmPasswordController,
                  maxLines: 1,
                  title: 'Xác nhận Mật khẩu ',
                  inputType: TextInputType.text,
                  obscureText: !controller.obsEditConfirmPassword.value,
                  icon: controller.obsEditConfirmPassword.value == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.seeEditConfirmPassword();
                  },
                ),
                const SizedBox(
                  height: 25,
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
                        final idAdded = prefs.getInt('id');
                        controller.editSecondAccount(
                          id: userInfo.id.toString(),
                          fullname: controller.editFullNameController.text,
                          relationship:
                              controller.editRelationshipController.text,
                          phone: controller.editPhoneController.text,
                          password: controller.editPasswordController.text,
                          confirmpassword:
                              controller.editConfirmPasswordController.text,
                          addedby: idAdded.toString(),
                        );
                      },
                      child: controller.isLoadingButton.value == true
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator())
                          : const Text(
                              'Lưu lại',
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
