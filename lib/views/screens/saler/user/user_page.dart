import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/user/saler_user_controller.dart';
import 'package:hoavien_app/models/auth/user_model.dart';
import 'package:hoavien_app/views/screens/customers/user/info_user_page.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class SalerUserPage extends GetView<SalerUserController> {
  UserModel? user;
  SalerUserPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CustomTitleText(
          title: 'Thông tin cá nhân',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/thanhvien.jpg'),
                              radius: 42,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${user?.data?.userInfo?.fullname}',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Saler',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      _customButtonUser(
                        icon: Icons.person,
                        label: 'Thông tin cá nhân',
                        onTap: () {
                          Get.to(() => InfoUserPage());
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.phone_in_talk,
                        label: 'Báo cáo sai thông tin',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.lock,
                        label: 'Thay đổi mật khẩu',
                        onTap: () {
                          Get.toNamed('/thaydoimatkhau');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      _customButtonUser(
                        icon: Icons.assignment_outlined,
                        label: 'Giới thiệu về ứng dụng',
                        onTap: () {
                          Get.toNamed('/gioithieu');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.web_outlined,
                        label: 'Chính sách và điều khoản',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.share,
                        label: 'Chia sẻ app',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.logout,
                        label: 'Đăng xuất',
                        onTap: () {
                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_customButtonUser(
    {Function()? onTap, required IconData icon, required String label}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff865841),
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          label,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ),
  );
}
