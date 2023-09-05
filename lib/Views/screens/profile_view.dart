import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Helpers/size.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
                padding:  EdgeInsets.only(top:55.0.sp),
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
                      style: const TextStyle(fontFamily: 'Poppins',color: cBlue),
                    ),
                   
                  ],
                ),
              ),
            ),
            Positioned(
               top: 0,
              left: kWidth(context)/3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53.r),
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 2),
color: cLightGrey.withOpacity(.8),
  blurRadius: 5,
  spreadRadius: 0,),
                  ]
                ),
                child: CircleAvatar(
                         radius: 53.r,
                         backgroundColor: cWhite,
                  child: CircleAvatar(
                      radius: 50.r,
                       backgroundColor: cBlue,
                      backgroundImage: Image.network(
                        '${FirebaseAuth.instance.currentUser?.photoURL}',
                        
                      ).image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
