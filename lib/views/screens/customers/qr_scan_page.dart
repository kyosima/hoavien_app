import 'package:flutter/material.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

import '../../../constance.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: secondaryColor),
        backgroundColor: Colors.white,
        title: CustomTitleText(
          title: 'Quét mã QR kiếm tra thông tin',
        ),
      ),
    );
  }
}
