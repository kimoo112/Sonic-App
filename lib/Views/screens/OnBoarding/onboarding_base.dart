import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../Helpers/colors.dart';
import 'second_onbording_view.dart';
import 'third_onboarding_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/vectors.dart';

import '../../../Helpers/navigate.dart';
import '../Login/signin_view.dart';
import 'onbording_view.dart';

class OnboardingBase extends StatefulWidget {
  const OnboardingBase({Key? key}) : super(key: key);

  @override
  State<OnboardingBase> createState() => _OnboardingBaseState();
}

class _OnboardingBaseState extends State<OnboardingBase> {
  bool isLast = false;
  List<Widget> onboardingList = [
    const OnboardingView(),
    const SecondOnbordingView(),
    const ThirdOnboardingView(),
  ];
  final _controller = PageController();
  int position = 0;
  bool isVisible = true;

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
            children: const [
              OnboardingView(),
              SecondOnbordingView(),
              ThirdOnboardingView(),
            ],
          ),
          nikeLogo(),
          vectors(),
          // dot indicators
          Positioned(
            bottom: 80,
            left: 50,
            right: 50,
            child: DotsIndicator(
              dotsCount: onboardingList.length,
              position: position,
              decorator: DotsDecorator(
                color: cLight,
                activeColor: cIndicator,
                size: const Size.square(9.0),
                activeSize: const Size(50.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: TextButton(
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutCubicEmphasized);
              },
              child: const Text(
                "Previous",
                style: TextStyle(color: cLight),
              ),
            ),
          ),

          Positioned(
            top: 30,
            right: 8,
            child: TextButton(
              onPressed: () {
                _controller.animateToPage(2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: cLight),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: CustomButton(
              onTap: () {
                isLast
                    ? navigateToPR(SigninView(), context)
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
