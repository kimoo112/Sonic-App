// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;
import '../../Controller/cart_controller.dart';
import '../../Helpers/colors.dart';

class BadgeIcon extends StatelessWidget {
  BadgeIcon({
    super.key,
  });
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
     () => badges.Badge(
        badgeAnimation: const badges.BadgeAnimation.fade(
          animationDuration: Duration(seconds: 2),
          colorChangeAnimationDuration: Duration(seconds: 2),
          loopAnimation: true,
          curve: Curves.linear,
          colorChangeAnimationCurve: Curves.bounceIn,
        ),
        badgeContent: Text(controller.cartList.length.toString(),style: TextStyle(fontFamily: 'Poppins'),),
        child: const Icon(Iconsax.bag_24, color: cDark),
      ),
    );
  }
}
