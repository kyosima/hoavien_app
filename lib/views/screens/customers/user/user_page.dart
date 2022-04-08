import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/auth_controller.dart';
import 'package:hoavien_app/controllers/customers/user/user_controller.dart';
import 'package:hoavien_app/views/screens/customers/user/info_user_page.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

import '../../../../constance.dart';

class UserPage extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  final AuthController authController = Get.put(AuthController());
  UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const CustomTitleText(
          title: 'Thông tin cá nhân',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(() {
                    if (controller.loadingUser.value) {
                      return Container();
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 42,
                                backgroundImage: controller
                                            .infoUser.value?.avatar ==
                                        null
                                    ? const AssetImage(defaultUser)
                                    : CachedNetworkImageProvider(
                                            '$baseURL${controller.infoUser.value?.avatar}')
                                        as ImageProvider,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.infoUser.value?.userInfo?.fullname}',
                                    style: const TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Tài khoản chính',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
              const SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.shopping_cart,
                        label: 'Lịch sử mua hàng',
                        onTap: () {
                          Get.toNamed('/lichsumuahang');
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.phone_in_talk,
                        label: 'Báo cáo sai thông tin',
                        onTap: () {},
                      ),
                      const SizedBox(
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
              const SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.web_outlined,
                        label: 'Chính sách và điều khoản',
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.share,
                        label: 'Chia sẻ app',
                        onTap: () {
                          if (Platform.isIOS) {
                            print('share IOS');
                          } else {
                            print('share andoird');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.logout,
                        label: 'Đăng xuất',
                        onTap: () {
                          authController.logOut();
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
                decoration: const BoxDecoration(
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
          const SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
