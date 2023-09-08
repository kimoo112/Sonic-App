import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../Views/screens/Cart%20&%20Favorites/cart_view.dart';
import '../Helpers/colors.dart';
import '../Helpers/navigate.dart';
import '../Model/popular_shoes_model.dart';

class CartController extends GetxController {
  RxList<dynamic> cartList = <dynamic>[].obs;
  Rx<double> priceOfProducts = 0.0.obs;
  addToCart(PopularShoesModel product, context) {
    cartList.add(product);
    priceOfProducts += product.price;
    showAddToCartSnackBar(context);
  }

  bool isEmpty() {
    return cartList.isEmpty;
  }

  deleteFromCart(PopularShoesModel product) {
    cartList.remove(product);
    priceOfProducts -= product.price;
  }

  deleteAllCart() {
    cartList.clear();
    priceOfProducts = 0.0.obs;
  }
}

void showAddToCartSnackBar(context) {
  Get.snackbar(
    "Cart Update", // title
    "Successfully added to your cart!", // message
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Got it!",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    messageText: const Text(
      "Your journey to style continues.",
      style: TextStyle(
        color: Colors.white70,
      ),
    ),
    backgroundColor:cBlue,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 2),
      ),
    ],
    borderRadius: 30,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    margin: const EdgeInsets.all(16),
    duration: const Duration(milliseconds: 1200),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,

    forwardAnimationCurve: Curves.fastOutSlowIn,
    icon: const Icon(Iconsax.bag_24, 
        size: 33.0, color: Colors.white),
    mainButton: TextButton(
      onPressed: () {
        getTo(const CartView(), context);
      },
      child: const Text(
        "VIEW CART",
        style: TextStyle(
          color: cWhite,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
