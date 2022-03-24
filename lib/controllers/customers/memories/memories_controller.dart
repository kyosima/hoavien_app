import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MemoriesBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MemoriesController());
  }
}

class MemoriesController extends GetxController {
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
}