import 'package:flutter/material.dart';
import 'package:shoes_store/Model/popular_shoes_model.dart';

import 'custom_product_container.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductContainer(
            image: getPopularShoes[index].image,
            model: getPopularShoes[index].model,
            price: getPopularShoes[index].price, index: index,
          );
        },
      ),
    );
  }
}
