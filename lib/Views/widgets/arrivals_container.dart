import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/images.dart';

class ArrivalsContainer extends StatelessWidget {
  const ArrivalsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(16)),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Summer Sale',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 5.h),
                  const Text('25% OFF',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Poppins',
                          color: cSale,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Image.asset(
                Assets.imagesArrivalsShoes,
                width: 140,
              ),
            ],
          ),
          Image.asset(Assets.vectorsStars),
          Positioned(
              right: 100.sp, top: 0, child: Image.asset(Assets.vectorsNew))
        ],
      ),
    );
  }
}
