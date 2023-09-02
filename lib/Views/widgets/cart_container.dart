import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';

class CartContainer extends StatelessWidget {
  const CartContainer(
      {Key? key, required this.image, required this.name, required this.price, this.onPressed})
      : super(key: key);
  final dynamic image;
  final String name;
  final double price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 104,
      margin: const EdgeInsets.all(12),
      padding: EdgeInsets.only(right: 40.sp),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: cWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              width: 140,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,fontFamily: 'Poppins'
                ),
                maxLines: 2, // Set a maximum of 2 lines
                ),
                Text(
                  '\$ $price',
                  style:
                      const TextStyle(fontFamily: 'Poppins', color: cBackGround),
                ),
              
              ],
            ),
          )
        ],
      ),
    );
  }
}
