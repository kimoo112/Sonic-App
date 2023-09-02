import 'package:flutter/material.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../../Helpers/navigate.dart';
import '../../../Helpers/size.dart';

import '../../widgets/custom_button.dart';
import '../Login/signin_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

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
                    const Text('Welcome To',
                        style: TextStyle(
                            color: cLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                    const Text('Nike',
                        style: TextStyle(
                            color: cLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 28)),
                    const SizedBox(height: 10),
                    Image.asset(Assets.vectorsUnderLineVector),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: kWidth(context) * .6,
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
