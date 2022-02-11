import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/saler/dashboard/saler_dashboard_controller.dart';

import 'package:hoavien_app/views/screens/saler/home/home_page.dart';
import 'package:hoavien_app/views/screens/saler/statistical_page.dart';
import 'package:hoavien_app/views/screens/saler/transaction_page.dart';
import 'package:hoavien_app/views/screens/saler/user_page.dart';

class DashboardSalerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalerDashboardController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              SalerHomePage(),
              TransactionPage(),
              StatisticalPage(),
              SalerUserPage(),
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
                    ? CupertinoIcons.arrow_right_arrow_left_square_fill
                    : CupertinoIcons.arrow_right_arrow_left_square,
                label: 'Giao dịch',
              ),
              _bottomNavigationBarItem(
                icon: controller.tabIndex == 2
                    ? CupertinoIcons.chart_bar_circle_fill
                    : CupertinoIcons.chart_bar_circle,
                label: 'Thống kê',
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
