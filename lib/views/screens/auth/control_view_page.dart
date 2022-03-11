import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/controllers/auth/control_view_controller.dart';
import 'package:hoavien_app/views/dashboard/customer/dashboard_customer_page.dart';
import 'package:hoavien_app/views/dashboard/saler/dashboard_saler_page.dart';
import 'package:hoavien_app/views/dashboard/second_accound/dashboard_secondaccount_page.dart';
import 'package:hoavien_app/views/screens/auth/login_page.dart';

class ControlView extends StatelessWidget {
  final controller = Get.put(ControlViewController());

  ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userRole.value == "customer") {
        return DashboardPage();
      } else if (controller.userRole.value == "sale") {
        return DashboardSalerPage();
      } else if (controller.userRole.value == "customer-secondary") {
        return SecondAccountDashboardPage();
      } else {
        return LoginPage();
      }
    });
  }
}
