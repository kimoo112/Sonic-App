// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/cart_controller.dart';
import '../widgets/cart_container.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CartView'),
        ),
        body: ListView.builder(
            itemCount: controller.cartList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return CartContainer(
                image: controller.cartList[index].image,
                name: controller.cartList[index].model,
                price: controller.cartList[index].price,
              );
            }));
  }
}
