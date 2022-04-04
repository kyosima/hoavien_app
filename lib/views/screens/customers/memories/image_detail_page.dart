import 'package:flutter/material.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/controllers/customers/memories/memories_controller.dart';
import 'package:hoavien_app/models/memories/memories_model.dart';
import 'package:hoavien_app/views/screens/customers/memories/memories_page.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageDetailPage extends StatelessWidget {
  final Data image = Get.arguments;
  final controller = Get.put(MemoriesController());
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
                Share.share(image.link.toString());
              },
              icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    content: Column(
                      children: const [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Bạn có muốn xóa ảnh này?',
                          style: TextStyle(
                            color: colorText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Hủy')),
                      TextButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final idUser = prefs.getInt('id').toString();
                            controller.deleteImage(
                              id: image.id.toString(),
                              idUser: idUser,
                            );
                            Get.back();
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Đồng ý',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                    ]);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Hero(
        tag: '${image.link}',
        child: PhotoView(
          imageProvider: NetworkImage('$baseURL${image.link}'),
        ),
      ),
    );
  }
}
