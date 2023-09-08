import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/cart_controller.dart';
import '../../../Controller/favorite_controller.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/size.dart';
import '../../widgets/add_to_cart_button.dart';
import '../../widgets/badge_icon.dart';
import '../../widgets/favorite_button.dart';
import '../../widgets/get_back_arrow.dart';
import '../../widgets/porduct_info.dart';
import '../../widgets/random_list_view.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  DetailsView(
      {Key? key,
      required this.model,
      this.image,
      required this.price,
      required this.description,
      required this.index})
      : super(key: key);
  final String model;
  final String description;
  final dynamic image;
  final int index;
  final double price;
  CartController controller = Get.find();
  FavoriteController favController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 2,
          backgroundColor: cTransparent,
          centerTitle: true,
          title: screenTitle(),
          actions: [
            BadgeIcon(
              icColor: cBackGround,
              badgeColor: cDark,
            )
          ],
          leading: const GetBackArrow(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductInfo(model: model, price: price),
                    SizedBox(height: 30.h,),
                  ],
                ),
                _theStand(context),
                _addToFavoriteAndAddToCartRow(),
                _productImage(context),
                 _theDescription(context),
                Positioned(
                  bottom: kWidth(context) / 1.9,
                  right: 0,
                  left: 0,
                  child: const RandomListView(),
                ),
              ],
            ),
          ),
        ));
  }

  Positioned _addToFavoriteAndAddToCartRow() {
    return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      favoriteButton(),
                      AddToCartButton(controller: controller, index: index),
                    ],
                  ));
  }

  Text screenTitle() {
    return const Text(
      'Spotlight',
      style: TextStyle(
          letterSpacing: 1,
          color: cDark,
          fontSize: 20,
          fontWeight: FontWeight.w600),
    );
  }

  Positioned _productImage(BuildContext context) {
    return Positioned(
      bottom: kWidth(context) / 1.2,
      right: 0.h,
      left: 0.h,
      child: SizedBox(
          width: 350,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          )),
    );
  }

  Container favoriteButton() {
    return Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: cWhite),
        child: FavoriteButton(favController: favController, index: index));
  }

  Positioned _theStand(context) {
    return Positioned(
        top: 0.h,
        bottom: kWidth(context) / 8.h,
        right: 0.h,
        left: 0.h,
        child: Image.asset(
          Assets.imagesStand,
        ));
  }

  Positioned _theDescription(context) {
    return Positioned(
                    bottom: kWidth(context) / 3,
                    right: 0,
                    left: 0,
                    child:Row(
      children: [
        Flexible(
            child: Text(
          description,
          style: TextStyle(
              color: cGrey, fontWeight: FontWeight.w500, fontSize: 16.sp),
          textAlign: TextAlign.justify,
        )),
      ],
    ));
  }
}
