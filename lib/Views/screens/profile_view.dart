import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Controller/cart_controller.dart';
import '../../Controller/favorite_controller.dart';
import '../../Helpers/colors.dart';
import '../widgets/favorite_cart_product_container.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_image.dart';
import '../widgets/username_email.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  FavoriteController favController = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlue,
      body: Stack(
        children: [
          Container(
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
                          userNameAndEmail(),
                          FavoritesAndCartProducts(
                              favController: favController,
                              cartController: cartController),
                                SizedBox(
                            height: 22.h,
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
                profileImage(context),
              ],
            ),
          ),
          Positioned(top: 10.h, child: logoutButton(context, cWhite))
        ],
      ),
    );
  }
}
