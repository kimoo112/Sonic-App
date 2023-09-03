
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../Controller/cart_controller.dart';
import '../../Helpers/colors.dart';
import '../../Model/popular_shoes_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.controller,
    required this.index,
  });

  final CartController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
       );
  }
}
