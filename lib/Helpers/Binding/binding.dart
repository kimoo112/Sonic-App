import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';

class GetBingding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(FavoriteController());
    Get.put(SearchController());
  }
}
