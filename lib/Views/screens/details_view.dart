import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/Helpers/images.dart';

import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';
import '../widgets/badge_icon.dart';
import '../widgets/favorite_button.dart';
import '../widgets/get_back_arrow.dart';
import '../widgets/porduct_info.dart';

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
          title: const Text(
            'Spotlight',
            style: TextStyle(
                letterSpacing: 1,
                color: cDark,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
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
                  children: [
                    ProductInfo(model: model, price: price),
                    SizedBox(
                        width: 350,
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 30.h,
                    ),
                    theDescription()
                  ],
                ),
                theStand(),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: cWhite),
                            child: FavoriteButton(
                                favController: favController, index: index)),
                       InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              controller.addToCart(
                                  getPopularShoes[index], context);
                            },
                            child: Container(
                              width: 208.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: cBackGround,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Iconsax.bag_24,
                                      color: cWhite,
                                    ),
                                    Text(
                                      'Add to Cart',
                                      style: TextStyle(color: cWhite),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    )),

              ],
            ),
          ),
        ));
  }

  Positioned theStand() {
    return Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: Image.asset(Assets.imagesStand));
  }

  Row theDescription() {
    return Row(
      children: [
        Flexible(
            child: Text(
          description,
          style: const TextStyle(
              color: cGrey, fontWeight: FontWeight.w500, fontSize: 16),
          textAlign: TextAlign.justify,
        )),
      ],
    );
  }
}
