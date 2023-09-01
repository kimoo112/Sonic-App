import 'package:flutter/material.dart';

import '../../Helpers/colors.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({
    super.key,
    this.category = 'Popular Shoes',
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(category,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See All",
            style: TextStyle(
              color: cBackGround,
            ),
          ),
        ),
      ],
    );
  }
}
