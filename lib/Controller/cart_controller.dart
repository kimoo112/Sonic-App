import 'package:get/get.dart';
import 'package:shoes_store/Model/popular_shoes_model.dart';

class CartController extends GetxController {
  RxList<dynamic> cartList = <dynamic>[].obs;
  RxInt priceOfProducts = 0.obs;

  addToCart(PopularShoesModel product) {
    cartList.add(product);
    priceOfProducts += product.price;
  }

  deleteFromCart(PopularShoesModel product) {
    cartList.remove(product);
    priceOfProducts.value -= product.price;
  }

  deleteAllCart(PopularShoesModel product) {
    cartList.clear();
    priceOfProducts = 0.obs;
  }
}
