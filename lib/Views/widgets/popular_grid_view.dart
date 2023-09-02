import 'package:flutter/material.dart';

import '../../Model/popular_shoes_model.dart';
import 'custom_product_container.dart';

class PopularShoesGridView extends StatelessWidget {
  const PopularShoesGridView({
    super.key, required this.getPopularShoes,
  });
  final List getPopularShoes;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: getPopularShoes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a horizontal row
          childAspectRatio:
              0.7, // Aspect ratio of each item. Adjust this as needed.
          crossAxisSpacing: 10, // Spacing between items horizontally
          mainAxisSpacing: 10, // Spacing between items vertically
        ),
        itemBuilder: (BuildContext context, int index) {
          return CustomProductContainer(
              model: getPopularShoes[index].model,
              image: getPopularShoes[index].image,
              price: getPopularShoes[index].price,
              index: index);
        });
  }
}
