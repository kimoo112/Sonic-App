import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_store/Helpers/Strings/get_storage.dart';

class PickImageController extends GetxController {
  final picker = ImagePicker();
  RxString? imagePath = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getImage();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imagePath!.value = pickedFile.path;
        storage.write('imagePath', imagePath?.value);
      } else {}
      // ignore: empty_catches
    } catch (e) {}
  }

  getImage() async {
     String? storedImagePath = storage.read('imagePath');
    if (storedImagePath != null) {
    imagePath?.value=  storage.read('imagePath');
    }
  }
}
