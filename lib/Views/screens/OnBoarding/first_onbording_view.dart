import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/navigate.dart';
import '../../../Helpers/size.dart';

import '../../widgets/custom_button.dart';
import '../Login/signin_view.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBackGround,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome To',
                        style: TextStyle(
                            color: cLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp)),
                    Text('Sonic',
                        style: TextStyle(
                            color: cLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp)),
                    const SizedBox(height: 10),
                    Image.asset(Assets.vectorsUnderLineVector),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: kWidth(context) /2.5,
              child: Image.asset(
                Assets.imagesLegWIthShoes,
                fit: BoxFit.cover,
                width: kWidth(context),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: CustomButton(
                  name: 'Get Started',
                  onTap: () {
                    getOff(const SigninView(), context);
                  },
                ))
          ],
        ));
  }
}
