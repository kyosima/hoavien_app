import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ImageDetailPage extends StatelessWidget {
  final image = Get.arguments;
  ImageDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Chi tiết hình ảnh'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Share.share(image);
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(image),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 1.8,
        initialScale: PhotoViewComputedScale.contained * 1.1,
      ),
    );
  }
}
