import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';

class RandomProductsContainer extends StatelessWidget {
  const RandomProductsContainer({Key? key, required this.image})
      : super(key: key);
  final dynamic image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 80.h,
      margin: EdgeInsets.all(8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: cWhite),
      alignment: Alignment.center,
      child: Image.asset(image),
    );
  }
}
