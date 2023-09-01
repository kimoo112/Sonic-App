import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;
import '../../Helpers/colors.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const badges.Badge(
      badgeAnimation: badges.BadgeAnimation.fade(
        animationDuration: Duration(seconds: 3),
        colorChangeAnimationDuration: Duration(seconds: 2),
        loopAnimation: true,
        curve: Curves.linear,
        colorChangeAnimationCurve: Curves.bounceIn,
      ),
      badgeContent: Text('2'),
      child: Icon(Iconsax.bag_24, color: cDark),
    );
  }
}
