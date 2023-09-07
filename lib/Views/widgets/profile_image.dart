import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/pick_image_controller.dart';
import '../../Helpers/colors.dart';
import '../../Helpers/size.dart';

PickImageController imageController = Get.find();

Positioned profileImage(BuildContext context) {
  return Positioned(
    top: 0,
    left: kWidth(context) / 3,
    child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(53.r), boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          color: cLightGrey.withOpacity(.8),
          blurRadius: 5,
          spreadRadius: 0,
        ),
      ]),
      child: Stack(
        children: [
          Obx(
            () => CircleAvatar(
                radius: 53.r,
                backgroundColor: cWhite,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: cBlue,
                  backgroundImage: imageController.imagePath?.value != ''
                      ? FileImage(File(imageController.imagePath!.value))
                      : NetworkImage(
                              '${FirebaseAuth.instance.currentUser?.photoURL}')
                          as ImageProvider<Object>?,
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                imageController.pickImageFromGallery();
              },
              icon: const Icon(
                Icons.add,
                color: cWhite,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
