// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shoes_store/Helpers/navigate.dart';
import 'package:shoes_store/Views/screens/Cart%20&%20Favorites/cart_view.dart';
import '../../Controller/cart_controller.dart';
import '../../Helpers/colors.dart';

class BadgeIcon extends StatelessWidget {
  BadgeIcon({
    super.key,
    this.icColor = cDark,
    this.badgeColor = cBackGround,
    this.contentColor = cWhite,
    this.onTap,
  });
  final Color icColor;
  final Color badgeColor;
  final Color contentColor;
  final void Function()? onTap;
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onTap ??
            () {
              getTo(const CartView(), context);
            },
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(seconds: 2),
              colorChangeAnimationDuration: Duration(seconds: 2),
              loopAnimation: true,
              curve: Curves.linear,
              colorChangeAnimationCurve: Curves.bounceIn,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: badgeColor,
            ),
            badgeContent: Text(
              controller.cartList.length.toString(),
              style: TextStyle(fontFamily: 'Poppins', color: contentColor),
            ),
            child: Icon(Iconsax.bag_24, color: icColor),
          ),
        ),
      ),
    );
  }
}
