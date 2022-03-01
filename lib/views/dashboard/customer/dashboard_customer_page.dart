import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/dashboard/dashboard_controller.dart';
import 'package:hoavien_app/views/screens/customers/event/event_page.dart';
import 'package:hoavien_app/views/screens/customers/genealogy/genealogy_page.dart';
import 'package:hoavien_app/views/screens/customers/home/home_page.dart';
import 'package:hoavien_app/views/screens/customers/memories/memories_page.dart';
import 'package:hoavien_app/views/screens/customers/user/user_page.dart';

class DashboardPage extends StatelessWidget {
  final user = Get.arguments;
  DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(user: user),
              MemoriesPage(),
              const GenealogyPage(),
              EventPage(),
              UserPage(user: user),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: secondaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 5,
            items: [
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 0
                    ? CupertinoIcons.house_fill
                    : CupertinoIcons.home,
                label: 'Trang chủ',
              ),
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 1
                    ? CupertinoIcons.camera_on_rectangle_fill
                    : CupertinoIcons.camera_on_rectangle,
                label: 'Miền ký ức',
              ),
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 2
                    ? Icons.account_tree_sharp
                    : Icons.account_tree_outlined,
                label: 'Gia phả',
              ),
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 3
                    ? CupertinoIcons.calendar_circle_fill
                    : CupertinoIcons.calendar_circle,
                label: 'Sự kiện',
              ),
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 4
                    ? CupertinoIcons.person_fill
                    : CupertinoIcons.person,
                label: 'Cá nhân',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
