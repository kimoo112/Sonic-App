import 'package:flutter/cupertino.dart';
import 'package:shoes_store/Controller/cart_controller.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Views/widgets/cart_container.dart';

class CartContainerWithDismissible extends StatelessWidget {
  const CartContainerWithDismissible({
    super.key,
    required this.controller,
    required this.index,
  });

  final CartController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      crossAxisEndOffset: .8,
      key: UniqueKey(),
      secondaryBackground: Container(
        width: 335,
        height: 104,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: cDismiss, borderRadius: BorderRadius.circular(11)),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 17.0),
          child: Icon(CupertinoIcons.trash, color: cWhite),
        ),
      ),
      background: Container(
        width: 335,
        height: 104,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: cDismiss, borderRadius: BorderRadius.circular(11)),
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.only(left: 17.0),
          child: Icon(CupertinoIcons.trash, color: cWhite),
        ),
      ),
      onDismissed: (direction) {
        controller.deleteFromCart(controller.cartList[index]);
      },
      child: CartContainer(
        image: controller.cartList[index].image,
        name: controller.cartList[index].model,
        price: controller.cartList[index].price,
        onPressed: () {
          controller.deleteFromCart(controller.cartList[index]);
        },
      ),
    );
  }
}
