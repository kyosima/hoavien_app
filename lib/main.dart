import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/auth/forget_password_controller.dart';
import 'package:hoavien_app/controllers/auth/login_controller.dart';
import 'package:hoavien_app/controllers/auth/resetpasword_controller.dart';
import 'package:hoavien_app/controllers/customers/home_controller.dart';
import 'package:hoavien_app/controllers/customers/search_controller.dart';
import 'package:hoavien_app/controllers/customers/taisanso_detail_controller.dart';
import 'package:hoavien_app/views/screens/auth/forgot_password_page.dart';
import 'package:hoavien_app/views/screens/auth/login_page.dart';
import 'package:hoavien_app/views/screens/auth/new_password.dart';
import 'package:hoavien_app/views/screens/auth/otp_page.dart';
import 'package:hoavien_app/views/screens/customers/add_second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/checkout_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/checkout_page.dart';
import 'package:hoavien_app/views/screens/customers/direct_map_page.dart';
import 'package:hoavien_app/views/screens/customers/home_page.dart';
import 'package:hoavien_app/views/screens/customers/notification_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/notifications_page.dart';
import 'package:hoavien_app/views/screens/customers/qr_scan_page.dart';
import 'package:hoavien_app/views/screens/customers/search_resuft_page.dart';
import 'package:hoavien_app/views/screens/customers/second_account_page.dart';
import 'package:hoavien_app/views/screens/customers/taisanso_detail_page.dart';
import 'package:hoavien_app/views/screens/customers/taisanso_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          primaryColor: primaryColor,
        ),
        home: LoginPage(),
        initialBinding: LoginBinding(),
        getPages: [
          GetPage(
            name: '/login',
            page: () => LoginPage(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: '/forgotpassword',
            page: () => const ForgotPassword(),
            binding: ForgetPasswordBinding(),
          ),
          GetPage(
            name: '/otp',
            page: () => const OtpPage(),
          ),
          GetPage(
            name: '/newpassword',
            page: () => NewPassword(),
            binding: ResetPasswordBinding(),
          ),
          GetPage(
            name: '/home',
            page: () => HomePage(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: '/searchresuft',
            page: () => SearchResuftPage(),
            binding: SearchBindings(),
          ),
          GetPage(
            name: '/notification',
            page: () => NotificationsPage(),
          ),
          GetPage(
            name: '/notificationdetail',
            page: () => NotificationDetailPage(),
          ),
          GetPage(
            name: '/taisanso',
            page: () => TaiSanSoPage(),
          ),
          GetPage(
            name: '/taisansodetail',
            page: () => TaisansoDetailPage(),
            binding: TaisansoDetailBindings(),
          ),
          GetPage(
            name: '/sodochidan',
            page: () => DirectMapPage(),
          ),
          GetPage(
            name: '/qrscan',
            page: () => QrScanPage(),
          ),
          GetPage(
            name: '/checkout',
            page: () => CheckoutPage(),
          ),
          GetPage(
            name: '/checkoutdetail',
            page: () => CheckoutDetail(),
          ),
          GetPage(
            name: '/secondaccount',
            page: () => SecondAccount(),
          ),
          GetPage(
            name: '/addsecondaccount',
            page: () => AddSecondAccountPage(),
          ),
        ]);
  }
}
