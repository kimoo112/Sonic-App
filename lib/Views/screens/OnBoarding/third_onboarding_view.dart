import 'package:flutter/material.dart';
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
        const Text(
          'You Have the',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        const Text(
          'Power',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        const SizedBox(height: 10),
        const Text(
          'There Are Many Beautiful And Attractive Plants To Your Room',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.w200, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
