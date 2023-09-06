import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  final picker = ImagePicker();
  RxString? imagePath=''.obs;

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imagePath!.value = pickedFile.path;
        print('Picked an image from gallery: ${pickedFile.path}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error while picking the image: $e');
    }
  }
}
