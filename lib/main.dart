import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/views/screens/forgot_password_page.dart';
import 'package:hoavien_app/views/screens/login_page.dart';
import 'package:hoavien_app/views/screens/new_password.dart';
import 'package:hoavien_app/views/screens/otp_page.dart';

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
          fontFamily: 'Mulish',
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        getPages: [
          GetPage(
            name: '/login',
            page: () => const LoginPage(),
          ),
          GetPage(
            name: '/forgotpassword',
            page: () => const ForgotPassword(),
          ),
          GetPage(
            name: '/otp',
            page: () => OtpPage(),
          ),
          GetPage(
            name: '/newpassword',
            page: () => NewPassword(),
          ),
        ]);
  }
}
