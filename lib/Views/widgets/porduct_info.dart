import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/colors.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.model,
    required this.price,
  });

  final String model;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model,
              style: const TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              'Men’s Shoes',
              style: TextStyle(
                  color: cGrey, fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '\$$price',
              style: const TextStyle(
                  color: cBackGround,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 26),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ],
    );
  }
}
