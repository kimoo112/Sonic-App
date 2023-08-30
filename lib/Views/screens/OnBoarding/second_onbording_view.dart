import 'package:flutter/material.dart';
import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';

class SecondOnbordingView extends StatelessWidget {
  const SecondOnbordingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesShoes2,fit: BoxFit.cover,),
        const Text(
          'Let’s Start Journey',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const Text(
          ' With Nike',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(height: 10),
        const Text(
          'Smart, Gorgeous & Fashionable Collection Explor Now',
          style: TextStyle(
              color: cLight, fontWeight: FontWeight.w200, fontSize: 18),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
