import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class DirectMapPage extends StatefulWidget {
  const DirectMapPage({Key? key}) : super(key: key);

  @override
  State<DirectMapPage> createState() => _DirectMapPageState();
}

class _DirectMapPageState extends State<DirectMapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        title: const CustomTitleText(
          title: 'Sơ đồ chỉ dẫn',
        ),
      ),
      body: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://vr360.hoavienbinhan.vn/#van-phuc',
      ),
    );
  }
}
