import 'package:get/get.dart';
import 'package:shoes_store/Model/popular_shoes_model.dart';

class CartController extends GetxController {
  RxList<dynamic> cartList = <dynamic>[].obs;
  Rx<double> priceOfProducts = 0.0.obs;
  bool hasAddedDeliveryCost = false;

  addToCart(PopularShoesModel product) {
    cartList.add(product);
    priceOfProducts += product.price;
  }

  double getPrice() {
    priceOfProducts.value += 60.0;
    return priceOfProducts.value;
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
