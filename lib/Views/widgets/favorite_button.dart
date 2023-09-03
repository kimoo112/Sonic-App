import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Controller/favorite_controller.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.favController,  
    required this.index,
  });

  final FavoriteController favController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
          onPressed: () {
            favController.isFavorite(getPopularShoes[index])
                ? favController.removeFromFavorite(getPopularShoes[index])
                : favController.addToFavorite(getPopularShoes[index]);
          },
          icon: favController.isFavorite(getPopularShoes[index])
              ? const Icon(IconlyBold.heart, color: cLightOrange, size: 30)
              : const Icon(FontAwesomeIcons.heartCrack,
                  // Iconsax.heart_add4,
                  color: cBlue,
                  size: 30)),
    );
  }
}
