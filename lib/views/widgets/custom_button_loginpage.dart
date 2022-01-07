import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CustomButtonLoginPage extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CustomButtonLoginPage({
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: primaryColor, width: 1.0)),
        child: TextButton(
          onPressed: onPressed,
          // onPressed: () {
          //   Get.snackbar(
          //     "Đăng nhập thành công",
          //     "Chúc mừng bạn đã đăng nhập thành công",
          //     icon: Icon(Icons.person, color: primaryColor),
          //     snackPosition: SnackPosition.TOP,
          //   );
          // },
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
