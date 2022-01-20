import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AddSecondAccountPage extends StatelessWidget {
  const AddSecondAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: secondaryColor),
        title: CustomTitleText(
          title: 'Thêm tài khoản phụ',
        ),
      ),
    );
  }
}
