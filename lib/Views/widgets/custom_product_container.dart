import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_store/Helpers/colors.dart';

class CustomProductContainer extends StatefulWidget {
  final String model;
  final dynamic image;
  final int price;
  const CustomProductContainer(
      {Key? key, required this.model, required this.image, required this.price})
      : super(key: key);

  @override
  State<CustomProductContainer> createState() => _CustomProductContainerState();
}

class _CustomProductContainerState extends State<CustomProductContainer> {
  bool isFavorite = false;
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
              Image.asset(widget.image),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
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
                     SizedBox(height:5.h),
                    Text('\$ ${widget.price}',
                        style: const TextStyle(
                            color: cDark,fontWeight: FontWeight.w600, fontFamily: 'Poppins', fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? const Icon(IconlyBold.heart, color: cLightOrange)
                  : const Icon(FontAwesomeIcons.heartCrack,
                      // Iconsax.heart_add4,
                      color: cBlue)),
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
                onPressed: () {},
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
}
