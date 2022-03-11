import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/user/saler_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalerUserPage extends StatelessWidget {
  final SalerUserController controller = Get.put(SalerUserController());
  SalerUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Container();
                        } else {
                          return Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(controller
                                            .infoUser.value?.avatar ==
                                        null
                                    ? defaultUser
                                    : "$baseURL${controller.infoUser.value?.avatar}"),
                                radius: 42,
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
                                    'Saler',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                      }),
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
                        icon: Icons.person,
                        label: 'Thông tin cá nhân',
                        onTap: () {
                          Get.toNamed('/infousersaler');
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
                          Get.toNamed('/changepasswordsaler');
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
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _customButtonUser(
                        icon: Icons.logout,
                        label: 'Đăng xuất',
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.remove('id');
                          prefs.remove('userRole');
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
