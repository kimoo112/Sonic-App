import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../Controller/google_auth_controller.dart';

GoogleAuthController controller = Get.find();

Widget logoutButton(context, icColor) {
  return IconButton(
    onPressed: () {
      controller.logOut(context);
    },
    icon: Icon(
      IconlyLight.logout,
      color: icColor,
    ),
  );
}
