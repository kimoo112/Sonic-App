import 'package:get/get.dart';
import '../Model/popular_shoes_model.dart';

class CartController extends GetxController {
  RxList<dynamic> cartList = <dynamic>[].obs;
  Rx<double> priceOfProducts = 0.0.obs;

  addToCart(PopularShoesModel product) {
    cartList.add(product);
    priceOfProducts += product.price;
  }

 

  deleteFromCart(PopularShoesModel product) {
    cartList.remove(product);
    priceOfProducts -= product.price;
    update();
  }

  deleteAllCart(PopularShoesModel product) {
    cartList.clear();
    priceOfProducts = 0.0.obs;
  }
}
