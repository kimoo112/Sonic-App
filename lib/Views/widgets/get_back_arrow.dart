
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../Helpers/colors.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        IconlyBroken.arrowLeft2,
        color: cBackGround,
      ),
    );
  }
}
