import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/models/memories/album_model.dart';
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
  final isLoadingAlbum = false.obs;
  final thumnail = ''.obs;
  final nameAlbum = TextEditingController();
  final allAlbum = AlbumModel().data.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImage();
    getVideo();
    getAlbum();
  }

  final ImagePicker _picker = ImagePicker();

  void getAlbum() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id').toString();
      isLoadingAlbum.value = true;
      var response = await MemoriesService.getAlbum(id: userId);
      allAlbum.value = response?.data;
    } finally {
      isLoadingAlbum.value = false;
    }
  }

  void pickImageFromGalerry() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        isLoadingImage.value = true;
        final prefs = await SharedPreferences.getInstance();
        final idUser = prefs.getInt('id').toString();
        var response = await MemoriesService.createImage(
            id: idUser, image: File(image.path));
        if (response == 200) {
          var resuft = await MemoriesService.getImage(id: idUser);
          allImage.value = resuft?.data;
          Get.snackbar(
            "Th??m h??nh ???nh m???i th??nh c??ng",
            "H??nh ???nh m???i ???? ???????c c???p nh???t",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 1000),
          );
        } else {
          Get.snackbar(
            "Th??m h??nh ???nh m???i th???t b???i",
            "Kh??ng th??? c???p nh???t h??nh ???nh m???i",
            icon: const Icon(Icons.error, color: Colors.redAccent),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 1000),
          );
        }
      } finally {
        isLoadingImage.value = false;
      }
    } else {
      print('User not pick image');
    }
  }

  void pickVideoFromGalerry() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      try {
        isLoadingVideo.value = true;
        final prefs = await SharedPreferences.getInstance();
        final idUser = prefs.getInt('id').toString();
        var response = await MemoriesService.createVideo(
            id: idUser, video: File(video.path));
        if (response == 200) {
          var resuft = await MemoriesService.getVideo(id: idUser);
          allVideo.value = resuft?.data;
          Get.snackbar(
            "Th??m Video m???i th??nh c??ng",
            "Video ???? ???????c c???p nh???t",
            icon: const Icon(Icons.check_circle, color: Colors.green),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 1000),
          );
        } else {
          Get.snackbar(
            "Th??m video m???i th???t b???i",
            "Kh??ng th??? c???p nh???t video m???i",
            icon: const Icon(Icons.error, color: Colors.redAccent),
            snackPosition: SnackPosition.TOP,
            colorText: secondaryColor,
            backgroundColor: Colors.white.withOpacity(0.7),
            duration: const Duration(milliseconds: 1000),
          );
        }
      } finally {
        isLoadingVideo.value = false;
      }
    } else {
      print('user not pick video');
    }
  }

  void getImage() async {
    try {
      isLoadingImage.value = true;
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getInt('id');
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
    try {
      isLoadingImage.value = true;
      await MemoriesService.deleteImage(id: id, idUser: idUser);
      Get.snackbar(
        "X??a h??nh ???nh th??nh c??ng",
        "H??nh ???nh ???? ???????c x??a kh???i danh s??ch",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: const Duration(milliseconds: 1000),
      );
      var response = await MemoriesService.getImage(id: idUser);
      allImage.value = response?.data;
    } finally {
      isLoadingImage.value = false;
    }
  }

  void deleteAlbum({String? id}) async {
    try {
      isLoadingAlbum.value = true;
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getInt('id').toString();
      await MemoriesService.deleteAlbum(id: id, idUser: idUser);
      Get.snackbar(
        "X??a Album th??nh c??ng",
        "Album ???? ???????c x??a kh???i danh s??ch",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: const Duration(milliseconds: 1000),
      );
      var response = await MemoriesService.getAlbum(id: idUser);
      allAlbum.value = response?.data;
    } finally {
      isLoadingAlbum.value = false;
    }
  }

  void createAlbum({String? name}) async {
    try {
      isLoadingAlbum.value = true;
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getInt('id').toString();
      await MemoriesService.createAlbum(id: idUser, name: name);
      Get.snackbar(
        "Th??m Album th??nh c??ng",
        "Album ???? ???????c th??m v??o danh s??ch Album",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: const Duration(milliseconds: 1000),
      );
      nameAlbum.clear();
      var response = await MemoriesService.getAlbum(id: idUser);
      allAlbum.value = response?.data;
      update();
    } finally {
      isLoadingAlbum.value = false;
    }
  }

  void deleteVideo({String? id, String? idUser}) async {
    try {
      isLoadingVideo.value = true;
      await MemoriesService.deleteVideo(id: id, idUser: idUser);
      Get.snackbar(
        "X??a video th??nh c??ng",
        "Video ???? ???????c x??a kh???i danh s??ch",
        icon: const Icon(Icons.check_circle, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        colorText: secondaryColor,
        backgroundColor: Colors.white.withOpacity(0.7),
        duration: const Duration(milliseconds: 1000),
      );
      var response = await MemoriesService.getVideo(id: idUser);
      allVideo.value = response?.data;
    } finally {
      isLoadingVideo.value = false;
    }
  }
}
