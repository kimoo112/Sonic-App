import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/cart_controller.dart';
import '../../Helpers/colors.dart';
import '../../Helpers/size.dart';

class TotalCost extends StatelessWidget {
  const TotalCost({
    super.key,
    required this.controller,
    required this.isEmpty,
  });

  final CartController controller;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    bool isEmpty = controller.cartList.isEmpty;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                  color: cLightGrey.withOpacity(.3),
                  blurRadius: 15,
                  spreadRadius: 2)
            ],
            color: cWhite),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text('\$ ${controller.priceOfProducts.toInt()}',
                      style: const TextStyle(fontFamily: 'Poppins')),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delivery',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    isEmpty ? '\$ 0.0' : '\$ 60.20',
                    style: const TextStyle(fontFamily: 'Poppins'),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(
                indent: 22,
                endIndent: 11,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Cost',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                      isEmpty
                          ? '\$ ${(controller.priceOfProducts.value).toStringAsFixed(1)} '
                          : '\$ ${(controller.priceOfProducts.value + 60.20).toStringAsFixed(1)} ',
                      style: const TextStyle(
                          color: cBackGround,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                splashColor: cDismiss,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 50,
                  width: kWidth(context),
                  decoration: BoxDecoration(
                    color: cBackGround,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        fontSize: 20,
                        color: cWhite,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
