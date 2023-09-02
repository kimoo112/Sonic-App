import 'package:get/get.dart';
import 'package:shoes_store/Controller/cart_controller.dart';
import 'package:shoes_store/Controller/favorite_controller.dart';

class GetBingding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(FavoriteController());
  }
}
