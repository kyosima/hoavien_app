import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/models/memories/album_model.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class AlbumDetailPage extends StatelessWidget {
  final Data albumDetail = Get.arguments;
  AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitleText(
          title: albumDetail.name.toString(),
        ),
      ),
    );
  }
}
