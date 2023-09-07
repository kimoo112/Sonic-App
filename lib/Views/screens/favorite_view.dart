// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_store/Helpers/images.dart';
import '../../Controller/favorite_controller.dart';
import '../widgets/badge_icon.dart';
import '../../Helpers/colors.dart';
import '../widgets/favorite_grid_view.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key? key}) : super(key: key);
  FavoriteController controller = Get.find();
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    isEmpty = controller.favoriteList.isEmpty;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 2,
        backgroundColor: cTransparent,
        centerTitle: true,
        title: const Text(
          'My Favorites',
          style: TextStyle(
              color: cBackGround, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          BadgeIcon(
            icColor: cBackGround,
            badgeColor: cDark,
          )
        ],
      ),
      body: Obx(
        () => controller.isEmpty()
            ? isEmptyWidget()
            : FavoriteGridVIew(controller: controller),
      ),
    );
  }

  Column isEmptyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          Assets.imagesEmptyFavoriteLottie,
          width: 333,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Empty favorites? Let\'s change that. Dive into our collection and pick your Favorites! ✨',
          style: TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
