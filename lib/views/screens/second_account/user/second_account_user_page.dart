import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/second_account/user/secondaccount_user_controller.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class SecondAccountUserPage extends StatelessWidget {
  final SecondAccountUserController controller =
      Get.put(SecondAccountUserController());
  SecondAccountUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
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
                      Row(
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
                              Obx(() {
                                if (controller.isLoading.value) {
                                  return Container();
                                } else {
                                  return Text(
                                    '${controller.infoUser.value?.userInfo?.fullname}',
                                    style: const TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  );
                                }
                              }),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Tài khoản phụ',
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
                          Get.toNamed('/infosecondaccount');
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
                          Get.toNamed('/changesecondaccountpassword');
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
