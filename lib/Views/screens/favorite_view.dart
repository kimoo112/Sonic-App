// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/favorite_controller.dart';
import '../widgets/badge_icon.dart';
import '../widgets/favorite_container.dart';
import '../../Helpers/colors.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key? key}) : super(key: key);
  FavoriteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 2,
        backgroundColor: cTransparent,
        centerTitle: true,
        title: const Text(
          'My Favourite',
          style: TextStyle(color: cBackGround,fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          BadgeIcon(
            icColor: cBackGround,
            badgeColor: cDark,
          )
        ],
      ),
      body: Obx(
        () => GridView.builder(
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
            }),
      ),
    );
  }
}
