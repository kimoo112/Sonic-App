import 'package:get/get.dart';

import '../Model/popular_shoes_model.dart';

class FavoriteController extends GetxController {
  RxList favoriteList = [].obs;

  bool isFavorite(PopularShoesModel product) {
  return favoriteList.contains(product);
}
  addToFavorite(PopularShoesModel product) {
    
    favoriteList.add(product);
    // isFavorite.value = true;
  }
  removeFromFavorite(PopularShoesModel product) {
    favoriteList.remove(product);
    // isFavorite.value = false;
  }
}
