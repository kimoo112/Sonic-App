import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';

class ThirdOnboardingView extends StatelessWidget {
  const ThirdOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Image.asset(Assets.imagesShoes3),
        Text(
          'Step into Sonic',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 35.sp),
       textAlign: TextAlign.center, ),
        SizedBox(height: 10.h),
        Text(
          'Discover footwear that matches your pace. Ready, set, shop',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.w200, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
