
import 'package:flutter/material.dart';

import '../../Controller/favorite_controller.dart';
import 'favorite_container.dart';

class FavoriteGridVIew extends StatelessWidget {
  const FavoriteGridVIew({
    super.key,
    required this.controller,
  });

  final FavoriteController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.favoriteList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a horizontal row
          childAspectRatio:
              0.7, // Aspect ratio of each item. Adjust this as needed.
          crossAxisSpacing: 10, // Spacing between items horizontally
          mainAxisSpacing: 10, // Spacing between items vertically
        ),
        itemBuilder: (BuildContext context, int index) {
          return FavoriteContainer(
              model: controller.favoriteList[index].model,
              image: controller.favoriteList[index].image,
              price: controller.favoriteList[index].price,
              index: index);
        });
  }
}
