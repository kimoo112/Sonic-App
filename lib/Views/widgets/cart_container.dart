import 'package:flutter/material.dart';
import 'package:shoes_store/Helpers/colors.dart';

class CartContainer extends StatelessWidget {
  const CartContainer(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);
  final dynamic image;
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 104,
      margin: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: cWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(image),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
              ),
              Text(
                '\$ $price',
                style: const TextStyle(fontFamily: 'Poppins',color: cBackGround),
              )
            ],
          )
        ],
      ),
    );
  }
}
