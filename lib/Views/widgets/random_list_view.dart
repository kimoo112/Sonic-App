import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'random_products_container.dart';

import '../../Model/popular_shoes_model.dart';

class RandomListView extends StatelessWidget {
 const RandomListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return RandomProductsContainer(
            image: getPopularShoes[index].image,
          );
        },
      ),
    );
  }
}
