import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';
import '../../Helpers/colors.dart';

class FavoritesAndCartProducts extends StatelessWidget {
  const FavoritesAndCartProducts({
    super.key,
    required this.favController,
    required this.cartController,
  });

  final FavoriteController favController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: cLightGrey.withOpacity(.9),
            blurRadius: 7,
            spreadRadius: 1,
          ),
        ],
        color: cBlue,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        //todo add stack here to the button
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Icon(Iconsax.lovely5, color: cWhite),
              const Text('Favorites',
                  style: TextStyle(
                      fontFamily: 'Poppins', color: cWhite)),
              Text(
                  favController.favoriteList.length
                      .toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins', color: cWhite)),
            ],
          ),
          VerticalDivider(
            indent: 20,
            endIndent: 20,
            color: cWhite.withOpacity(.7),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Icon(Iconsax.shopping_bag5,
                  color: cWhite),
              const Text(
                'Products in Cart',
                style: TextStyle(
                    fontFamily: 'Poppins', color: cWhite),
              ),
              Text(cartController.cartList.length.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins', color: cWhite)),
            ],
          ),
        ],
      ),
    );
  }
}
