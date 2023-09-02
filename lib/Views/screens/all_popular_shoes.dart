import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';
import '../widgets/badge_icon.dart';
import '../widgets/popular_grid_view.dart';

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
            icon: const Icon(
              IconlyBroken.arrowLeft2,
              color: cBackGround,
            ),
          ),
          backgroundColor: cTransparent,
          centerTitle: true,
          title: const Text(
            'Popular Shoes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            BadgeIcon(
              icColor: cBackGround,
              badgeColor: cDark,
            )
          ],
        ),
        body:  PopularShoesGridView(getPopularShoes:getPopularShoes,));
  }
}
