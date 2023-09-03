import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';

class SecondOnbordingView extends StatelessWidget {
  const SecondOnbordingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesShoes2,
          fit: BoxFit.cover,
        ),
         SizedBox(height: 10.h),
        Text(
          "Discover Ultimate Sonic Elegance!",
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 28.sp),
      
      textAlign: TextAlign.center,  ),
       
         SizedBox(height: 10.h),
        Text(
          'Where fashion meets the art of footwear.',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.w200, fontSize: 18.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
