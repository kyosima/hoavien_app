import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/user/info_user_controller.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/views/widgets/custom_button_loginpage.dart';
import 'package:hoavien_app/views/widgets/custom_textfield.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class InfoUserPage extends StatelessWidget {
  final InfoUserController controller = Get.put(InfoUserController());
  var items = [
    'Nam',
    'Nữ',
  ];
  UserModel? user;
  InfoUserPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: CustomTitleText(
          title: 'Thông tin cá nhân',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 45,
                      ),
                    ),
                    Center(
                        child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: secondaryColor,
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  maxLines: 1,
                  title: 'Họ và tên',
                  inputType: TextInputType.text,
                  hintText: '${user?.data?.userInfo?.fullname}',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  maxLines: 1,
                  title: 'Số điện thoại đăng ký tài khoản',
                  inputType: TextInputType.number,
                  hintText: '${user?.data?.phone}',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.dateController,
                  maxLines: 1,
                  title: 'Ngày sinh',
                  inputType: TextInputType.datetime,
                  icon: Icons.date_range,
                  onPressed: () {
                    controller.setDate();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controller.sexMenuController,
                  decoration: InputDecoration(
                    labelText: 'Giới tính',
                    labelStyle: const TextStyle(
                      color: secondaryColor,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: secondaryColor,
                      fontSize: 20,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: secondaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        controller.sexMenuController.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButtonLoginPage(
                  title: 'Lưu lại',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
