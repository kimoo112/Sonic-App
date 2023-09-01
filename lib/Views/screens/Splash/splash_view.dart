import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../OnBoarding/onboarding_base.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlue,
      body: FlutterSplashScreen.scale(
        backgroundColor: cBlue,
        childWidget: Center(
          child: Image.asset(Assets.iconsLogo),
        ),
        defaultNextScreen: const OnboardingBase(),
      ),
    );
  }
}
