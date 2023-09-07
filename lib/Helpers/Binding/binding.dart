import 'package:get/get.dart';
import 'package:shoes_store/Controller/create_user_email_password_controller.dart';
import '../../Controller/pick_image_controller.dart';
import '../../Controller/switcher_controller.dart';

import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';
import '../../Controller/google_auth_controller.dart';

class GetBingding implements Bindings {
  @override
  void dependencies() {
    Get.put(PickImageController());
    Get.put(CreateUserEmailPasswordController());
    Get.put(CartController());
    Get.put(FavoriteController());
    Get.put(SwitcherController());
    Get.put(GoogleAuthController());
  }
}
