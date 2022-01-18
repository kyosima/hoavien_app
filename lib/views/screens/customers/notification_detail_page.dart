import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(
          color: secondaryColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Khuyến mãi',
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            CustomTitleText(
                title:
                    'CHƯƠNG TRÌNH ĐẠI LỄ VU LAN ĐƯỢC TỔ CHỨC TẠI HOA VIÊN BÌNH AN VÀO NGÀY 10/08/2019'),
          ],
        ),
      ),
    );
  }
}
