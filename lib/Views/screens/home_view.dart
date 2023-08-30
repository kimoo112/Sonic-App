import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Views/widgets/custom_searchbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.list_bullet_indent,
          color: cBackGround,
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(),
            SizedBox(height: 22.h),
            Text(
              'Select Category',
              style: TextStyle(
                  letterSpacing: .5, fontWeight: FontWeight.w600, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
