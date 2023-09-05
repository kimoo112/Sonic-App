import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/Helpers/size.dart';
import 'package:shoes_store/Views/screens/Base/base_screen.dart';
import '../../../Helpers/colors.dart';
import 'second_onbording_view.dart';
import 'third_onboarding_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/vectors.dart';

import '../../../Helpers/navigate.dart';
import '../Login/signin_view.dart';
import 'first_onbording_view.dart';

class OnboardingBase extends StatefulWidget {
  const OnboardingBase({Key? key}) : super(key: key);

  @override
  State<OnboardingBase> createState() => _OnboardingBaseState();
}

class _OnboardingBaseState extends State<OnboardingBase> {
  bool isLast = false;
  List<Widget> onboardingList = [
    const FirstOnboardingView(),
    const SecondOnbordingView(),
    const ThirdOnboardingView(),
  ];
  final _controller = PageController();
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackGround,
      body: Stack(
        children: [
          PageView(
              onPageChanged: (indx) {
                setState(() {
                  position = indx;
                  isLast = (indx == 2);
                });
              },
              controller: _controller,
              children: onboardingList),
      
          // dot indicators
          Positioned(
            bottom: 80,
            left: 50,
            right: 50,
            child: dotsIndicator(),
          ),
          Positioned(
            top: 30,
            child: previousButton(),
          ),
          Positioned(
            top: 30,
            right: 8,
            child: skipButton(),
          ),
              Positioned(
          right: 0,
          left: 0,
          top:0,
          bottom: 0,
                child: IgnorePointer(child: nikeLogo())),
          Positioned(
            top: 0, bottom: 30, right: 0, 
            left: 0,
            child: IgnorePointer(child: vectors())),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: CustomButton(
              onTap: () {
                isLast
                    ? getOff(
                        StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return const BaseView();
                            } else {
                              return const SigninView();
                            }
                          },
                        ),
                        context)
                    : _controller.nextPage(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOutCubicEmphasized);
              },
              name: _getButtonName(),
            ),
          ),
        ],
      ),
    );
  }

  TextButton previousButton() {
    return TextButton(
      onPressed: () {
        _controller.previousPage(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubicEmphasized);
      },
      child: const Text(
        "Previous",
        style: TextStyle(color: cLight),
      ),
    );
  }

  TextButton skipButton() {
    return TextButton(
      onPressed: () {
        _controller.animateToPage(2,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      },
      child: const Text(
        "Skip",
        style: TextStyle(color: cLight),
      ),
    );
  }

  DotsIndicator dotsIndicator() {
    return DotsIndicator(
      dotsCount: onboardingList.length,
      position: position,
      decorator: DotsDecorator(
        color: cLight,
        activeColor: cIndicator,
        size: const Size.square(9.0),
        activeSize: const Size(50.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  String _getButtonName() {
    if (position == 0) {
      return "Get Started";
    } else if (position == 1) {
      return "Next";
    } else {
      return "Go to Home";
    }
  }
}
