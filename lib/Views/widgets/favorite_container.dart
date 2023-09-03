import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';

import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';

class FavoriteContainer extends StatefulWidget {
  final String model;
  final dynamic image;
  final double price;
  final int index;

  const FavoriteContainer(
      {Key? key,
      required this.model,
      required this.image,
      required this.price,
      required this.index})
      : super(key: key);

  @override
  State<FavoriteContainer> createState() => _FavoriteContainerState();
}

class _FavoriteContainerState extends State<FavoriteContainer> {
  List<Color> colorList = [
    cBackGround,
    cDark,
    cIndicator,
    cRed,
    cDismiss,
    cGreen,
    cSoSad,
    cSale,
    cGrey
  ];
  CartController controller = Get.find();
  FavoriteController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 157.w,
      height: 201.h,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 155,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Best Seller',
                      style: TextStyle(
                          color: cBlue, fontFamily: 'Poppins', fontSize: 12),
                    ),
                    Text(
                      widget.model,
                      style: const TextStyle(
                          color: cGrey, fontFamily: 'Poppins', fontSize: 16),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${widget.price}',
                            style: const TextStyle(
                                color: cDark,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Row(
                          children: [
                            colorContainer(),
                            colorContainer(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                favController.removeFromFavorite(
                    favController.favoriteList[widget.index]);
              },
              icon: const Icon(IconlyBold.heart, color: cLightOrange)),
          Positioned(
            top: 0,
            right: 0,
            width: 34.w,
            height: 35.5.h,
            child: Container(
              decoration: BoxDecoration(
                  color: cBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    topRight: Radius.circular(16.r),
                  )),
              alignment: Alignment.center,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  controller.addToCart(getPopularShoes[widget.index],context);
                },
                icon: const Icon(
                  CupertinoIcons.add,
                  color: cWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container colorContainer() {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: cLight),
          color: colorList[Random().nextInt(colorList.length)]),
    );
  }
}
