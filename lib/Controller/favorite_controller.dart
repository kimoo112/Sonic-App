import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helpers/colors.dart';
import '../Helpers/Strings/get_storage.dart';

import '../Model/popular_shoes_model.dart';

class FavoriteController extends GetxController {
  RxList favoriteList = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  bool isFavorite(PopularShoesModel product) {
    return favoriteList.contains(product);
  }

  saveFavorite(PopularShoesModel product) {
    bool  isFavoritee = favoriteList.contains(product);
    storage.write('favorite_${product.id}', isFavoritee);
    // isFavoritee.value = favoriteList.contains(product);
    // storage.write('favorite_${product.id}', isFavoritee);
    // print('isFavore ${favoriteList.length}');
  }
removeFavoriteFromStorage(PopularShoesModel product) {
  storage.remove('favorite_${product.id}');
}
  void loadFavorites() {
    
    for (var product in getPopularShoes) {
      // Assuming getPopularShoes is your list of all products
      bool? status = storage.read('favorite_${product.id}');
      if (status == true) {
        favoriteList.add(product);
      }
    }
  }

  bool isEmpty() {
    return favoriteList.isEmpty;
  }

  addToFavorite(PopularShoesModel product) {
    favoriteList.add(product);
    

    saveFavorite(product);
    showAddedElegantSnackBar();
  }

  removeFromFavorite(PopularShoesModel product) {
      favoriteList.remove(product);
      saveFavorite(product);
    showDeletedElegantSnackBar();

  }
   removeAllFavorite() {
      for (var product in favoriteList) {
    removeFavoriteFromStorage(product); // This will remove each favorite using its unique key.
  }
      favoriteList.clear();

  }
}

void showAddedElegantSnackBar() {
  Get.snackbar(
    "Elegance Saved!", // title
    "Added with care to your favorites. A step closer to being yours.", // message
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Elegance Saved!",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    messageText: const Text(
      "Added with care to your favorites. A step closer to being yours.",
      style: TextStyle(
        color: Colors.white70,
      ),
    ),
    backgroundColor: Colors.transparent,
    boxShadows: [
      BoxShadow(
        color: cBlue.withOpacity(0.7),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
    backgroundGradient: const LinearGradient(
      colors: [Colors.tealAccent, Colors.purpleAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    icon: const Icon(CupertinoIcons.check_mark_circled_solid,
        size: 40.0, color: Colors.white),
    shouldIconPulse: true,
    borderRadius: 50, // even more rounded edges
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
    margin: const EdgeInsets.all(16),
    duration: const Duration(milliseconds: 1200),

    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    reverseAnimationCurve: Curves.fastOutSlowIn,
  );
}

void showDeletedElegantSnackBar() {
  Get.snackbar(
    "Elegance Saved!", // title
    "Added with care to your favorites. A step closer to being yours.", // message
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Elegance Released!",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    messageText: const Text(
      "Removed with thought from your favorites",
      style: TextStyle(
        color: Colors.white70,
      ),
    ),
    backgroundColor: Colors.transparent,
    boxShadows: [
      BoxShadow(
        color: const Color.fromARGB(255, 226, 5, 5).withOpacity(0.8),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
    backgroundGradient: const LinearGradient(
      colors: [Colors.tealAccent, Colors.purpleAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    icon: const Icon(CupertinoIcons.xmark_circle_fill,
        size: 40.0, color: Colors.white),
    shouldIconPulse: true,
    borderRadius: 50, // even more rounded edges
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
    margin: const EdgeInsets.all(16),
    duration: const Duration(milliseconds: 1200),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    reverseAnimationCurve: Curves.fastOutSlowIn,
  );
}
