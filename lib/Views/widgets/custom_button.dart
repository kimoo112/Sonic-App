import 'package:flutter/material.dart';

import '../../Helpers/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    this.onTap,
    this.color = cLight,
    this.nameColor = cDark,
    this.icon,
  });
  final String name;
  final void Function()? onTap;
  final Color color;
  final Color nameColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: cBlue.withOpacity(.7),
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 5, height: 0.0),
            Text(
              name,
              style: TextStyle(
                  color: nameColor, fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
