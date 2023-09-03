// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/size.dart';

import '../../Controller/cart_controller.dart';
import '../../Helpers/images.dart';
import '../widgets/cart_container.dart';
import '../widgets/get_back_arrow.dart';
import '../widgets/total_cost.dart';

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
      //Todo: Add GEt Storage
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isEmpty()
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset(Assets.imagesEmptyCartLottie),
                         SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Whoops! Your cart is playing hide and seek.\n Time to find some items.',
                          style:
                              TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))
                  : SizedBox(
                      height: kHieght(context) * .7,
                      child: ListView.builder(
                          itemCount: controller.cartList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              crossAxisEndOffset: .8,
                              key: UniqueKey(),
                              secondaryBackground: Container(
                                width: 335,
                                height: 104,
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: cDismiss,
                                    borderRadius: BorderRadius.circular(11)),
                                alignment: Alignment.centerRight,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 17.0),
                                  child:
                                      Icon(CupertinoIcons.trash, color: cWhite),
                                ),
                              ),
                              background: Container(
                                width: 335,
                                height: 104,
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: cDismiss,
                                    borderRadius: BorderRadius.circular(11)),
                                alignment: Alignment.centerLeft,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 17.0),
                                  child:
                                      Icon(CupertinoIcons.trash, color: cWhite),
                                ),
                              ),
                              onDismissed: (direction) {
                                controller
                                    .deleteFromCart(controller.cartList[index]);
                              },
                              child: CartContainer(
                                image: controller.cartList[index].image,
                                name: controller.cartList[index].model,
                                price: controller.cartList[index].price,
                                onPressed: () {
                                  controller.deleteFromCart(
                                      controller.cartList[index]);
                                },
                              ),
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
}
