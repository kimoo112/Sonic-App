import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';

Column userNameAndEmail() {
  return Column(
    children: [
      Text(
        '${FirebaseAuth.instance.currentUser?.email}',
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        '${FirebaseAuth.instance.currentUser?.displayName}',
        style: const TextStyle(fontFamily: 'Poppins', color: cBlue),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
