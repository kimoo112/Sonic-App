import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/Controller/cart_controller.dart';
import 'package:shoes_store/Controller/favorite_controller.dart';
import 'package:shoes_store/Controller/pick_image_controller.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/size.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  FavoriteController favController = Get.find();
  PickImageController imageController = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlue,
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 50.h, 20, 20),
              decoration: BoxDecoration(
                  color: cLight, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.only(top: 55.0.sp),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${FirebaseAuth.instance.currentUser?.email}',
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${FirebaseAuth.instance.currentUser?.displayName}',
                        style: const TextStyle(
                            fontFamily: 'Poppins', color: cBlue),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              color: cLightGrey.withOpacity(.9),
                              blurRadius: 7,
                              spreadRadius: 1,
                            ),
                          ],
                          color: cBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          //todo add stack here to the button
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const Icon(Iconsax.lovely5, color: cWhite),
                                const Text('Favorites',
                                    style: TextStyle(
                                        fontFamily: 'Poppins', color: cWhite)),
                                Text(
                                    favController.favoriteList.length
                                        .toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins', color: cWhite)),
                              ],
                            ),
                            VerticalDivider(
                              indent: 20,
                              endIndent: 20,
                              color: cWhite.withOpacity(.7),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const Icon(Iconsax.shopping_bag5,
                                    color: cWhite),
                                const Text(
                                  'Products in Cart',
                                  style: TextStyle(
                                      fontFamily: 'Poppins', color: cWhite),
                                ),
                                Text(cartController.cartList.length.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins', color: cWhite)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: cRed,
                ),
              ),
            ),
            profileImage(context),
            Positioned(
              top: 0,
              child: IconButton(
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

  Positioned profileImage(BuildContext context) {
    return Positioned(
      top: 0,
      left: kWidth(context) / 3,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(53.r),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                color: cLightGrey.withOpacity(.8),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ]),
        child: Obx(
          ()=> CircleAvatar(
              radius: 53.r,
              backgroundColor: cWhite,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: cBlue,
                backgroundImage: imageController.imagePath != ''
                    ? FileImage(File(imageController.imagePath!.value))
                    : NetworkImage(
                            '${FirebaseAuth.instance.currentUser?.photoURL}')
                        as ImageProvider<Object>?,
              )),
        ),
      ),
    );
  }
}
