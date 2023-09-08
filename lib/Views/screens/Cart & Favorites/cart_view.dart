// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_store/Controller/cart_controller.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/images.dart';
import 'package:shoes_store/Helpers/size.dart';
import 'package:shoes_store/Views/widgets/cart_container_with_dismissible.dart';
import 'package:shoes_store/Views/widgets/get_back_arrow.dart';
import 'package:shoes_store/Views/widgets/total_cost.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 2,
        leading: const GetBackArrow(),
        backgroundColor: cTransparent,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isEmpty()
                  ? _emptyCart()
                  : SizedBox(
                      height: kHieght(context) * .7,
                      child: ListView.builder(
                          itemCount: controller.cartList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CartContainerWithDismissible(
                              controller: controller,
                              index: index,
                            );
                          }),
                    ),
              controller.isEmpty()
                  ? const SizedBox()
                  : TotalCost(
                      controller: controller,
                      isEmpty: controller.isEmpty(),
                    ),
            ],
          )),
    );
  }

  Center _emptyCart() {
    return Center(
        child: Column(
      children: [
        Lottie.asset(Assets.imagesEmptyCartLottie),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Whoops! Your cart is playing hide and seek.\n Time to find some items.',
          style: TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
