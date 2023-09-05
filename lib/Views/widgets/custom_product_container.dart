import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Helpers/navigate.dart';
import '../screens/details_view.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';

import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';
import 'favorite_button.dart';

class CustomProductContainer extends StatefulWidget {
  final String model;
  final dynamic image;
  final double price;
  final int index;
  final String description;

  const CustomProductContainer(
      {Key? key,
      required this.model,
      required this.image,
      required this.price,
      required this.index,
      required this.description})
      : super(key: key);

  @override
  State<CustomProductContainer> createState() => _CustomProductContainerState();
}

class _CustomProductContainerState extends State<CustomProductContainer> {
  CartController controller = Get.find();
  FavoriteController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: cBackGround.withOpacity(.9),
      hoverColor: cLight,
      onTap: () {
        getTo(
            DetailsView(
              model: widget.model,
              price: widget.price,
              image: widget.image,
              description: widget.description,
              index: widget.index,
            ),
            context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 157.w,
          height: 201.h,
          decoration: BoxDecoration(
              color: cWhite, borderRadius: BorderRadius.circular(16)),
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
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Best Seller',
                          style: TextStyle(
                              color: cBlue,
                              fontFamily: 'Poppins',
                              fontSize: 12),
                        ),
                        Text(
                          widget.model,
                          style: const TextStyle(
                              color: cGrey,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                        SizedBox(height: 5.h),
                        Text('\$ ${widget.price}',
                            style: const TextStyle(
                                color: cDark,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              FavoriteButton(favController: favController, index: widget.index),
              Positioned(
                bottom: 0,
                right: 0,
                width: 34.w,
                height: 35.5.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: cBlue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: const Radius.circular(0),
                        bottomRight: Radius.circular(16.r),
                      )),
                  alignment: Alignment.center,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      controller.addToCart(
                          getPopularShoes[widget.index], context);
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
        ),
      ),
    );
  }
}
