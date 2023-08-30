
  import 'package:flutter/cupertino.dart';
import '../../Helpers/images.dart';

Positioned vectors() {
    return Positioned(
        top: 0,
        bottom: 30,
        right: 0,
        child: Image.asset(Assets.vectorsVectors,fit: BoxFit.contain,));
  }

  Positioned nikeLogo() {
    return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Image.asset(Assets.vectorsNikeLogo,fit: BoxFit.contain,));
  }
