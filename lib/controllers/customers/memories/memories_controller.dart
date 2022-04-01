import 'package:get/get.dart';
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
  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImage();
  }

  final ImagePicker _picker = ImagePicker();

  void pickImageFromGalerry() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
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

  void getImage({String? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt('id');
    var response = await MemoriesService.getImage(id: idUser.toString());
    try {
      isLoading.value = true;
      allImage.value = response?.data;
    } finally {
      isLoading.value = false;
    }
  }
}
