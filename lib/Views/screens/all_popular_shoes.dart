import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Model/popular_shoes_model.dart';
import 'package:shoes_store/Views/widgets/custom_product_container.dart';

class AllPopular extends StatelessWidget {
  const AllPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          scrolledUnderElevation: 2,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(IconlyBroken.arrowLeft2,color: cBackGround,),
          ),
          backgroundColor: cTransparent,
          centerTitle: true,
          title: const Text(
            'Popular Shoes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: GridView.builder(
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
            }));
  }
}
