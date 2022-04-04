import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/memories/memories_model.dart';
import 'package:hoavien_app/service_api/customer/memories/memories_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoriesBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MemoriesController());
  }
}

class MemoriesController extends GetxController {
  final allImage = MemoriesModel().data.obs;
  final isLoadingImage = false.obs;
  final isLoadingVideo = false.obs;
  final allVideo = MemoriesModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImage();
    getVideo();
  }

  final ImagePicker _picker = ImagePicker();

  void pickImageFromGalerry() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getInt('id').toString();
      var response = await MemoriesService.createImage(
          id: idUser, image: File(image.path));
      if (response == 200) {
        var resuft = await MemoriesService.getImage(id: idUser);
        allImage.value = resuft?.data;
        Get.snackbar(
          "Thêm hình ảnh mới thành công",
          "Hình ảnh mới đã được cập nhật",
          icon: const Icon(Icons.check_circle, color: Colors.green),
          snackPosition: SnackPosition.TOP,
          colorText: secondaryColor,
          backgroundColor: Colors.white.withOpacity(0.7),
          duration: const Duration(milliseconds: 1000),
        );
      } else {
        Get.snackbar(
          "Thêm hình ảnh mới thất bại",
          "Không thể cập nhật hình ảnh mới",
          icon: const Icon(Icons.error, color: Colors.redAccent),
          snackPosition: SnackPosition.TOP,
          colorText: secondaryColor,
          backgroundColor: Colors.white.withOpacity(0.7),
          duration: const Duration(milliseconds: 1000),
        );
      }
    } else {
      print('User not pick image');
    }
  }

  void pickVideoFromGalerry() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      print(video.path);
    } else {
      print('user not pick video');
    }
  }

  void getImage() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('id');

    try {
      isLoadingImage.value = true;
      var response = await MemoriesService.getImage(id: idUser.toString());
      allImage.value = response?.data;
    } finally {
      isLoadingImage.value = false;
    }
  }

  void getVideo() async {
    try {
      isLoadingVideo.value = true;
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getInt('id');
      var response = await MemoriesService.getVideo(id: idUser.toString());
      allVideo.value = response?.data;
    } finally {
      isLoadingVideo.value = false;
    }
  }

  void deleteImage({String? id, String? idUser}) async {
    await MemoriesService.deleteImage(id: id, idUser: idUser);
    Get.snackbar(
      "Xóa hình ảnh thành công",
      "Hình ảnh đã được xóa khỏi danh sách",
      icon: const Icon(Icons.check_circle, color: Colors.green),
      snackPosition: SnackPosition.TOP,
      colorText: secondaryColor,
      backgroundColor: Colors.white.withOpacity(0.7),
      duration: const Duration(milliseconds: 1000),
    );
    var response = await MemoriesService.getImage(id: idUser);
    allImage.value = response?.data;
  }
}
