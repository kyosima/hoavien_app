import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/second_account/dashboard/secondaccount_dashboard_controller.dart';
import 'package:hoavien_app/views/screens/second_account/event/second_account_event_page.dart';
import 'package:hoavien_app/views/screens/second_account/genealogy/second_account_genealogy_page.dart';
import 'package:hoavien_app/views/screens/second_account/home/second_account_home_page.dart';
import 'package:hoavien_app/views/screens/second_account/memories/second_account_memories_page.dart';
import 'package:hoavien_app/views/screens/second_account/user/second_account_user_page.dart';
class SecondAccountDashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecondAccountDashboardController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              SecondAccountHomePage(),
              SecondAccountMemoriesPage(),
              SecondAccountGenealogyPage(),
              SecondAccountEventPage(),
              SecondAccountUserPage(),
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
