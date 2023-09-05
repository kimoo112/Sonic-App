import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Model/popular_shoes_model.dart';
import '../../widgets/badge_icon.dart';
import '../../widgets/custom_searchbar.dart';
import '../../widgets/get_back_arrow.dart';

import '../../../Helpers/colors.dart';
import '../../../Helpers/images.dart';
import '../../widgets/popular_grid_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchController controller = Get.find();
  bool isEmpty = false;
  List<PopularShoesModel> searchedList = getPopularShoes;
  Future<void> searchForProducts(String value) async {
    searchedList = getPopularShoes
        .where((element) =>
            element.model.toLowerCase().contains(value.toLowerCase()))
        .toList();
    isEmpty = searchedList.isEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isEmpty ?cDark :cLight ,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: cTransparent,
        leading: const GetBackArrow(),
        actions: [
          BadgeIcon(
            icColor: cBackGround,
            badgeColor: isEmpty ?cLight :cDark,
            contentColor: isEmpty ?cDark :cLight ,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0.sp),
        child: Column(
          children: [
            Hero(
              tag: 'null',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSearchBar(
                  onChanged: (value) {
                    searchForProducts(value);
                  },
                ),
              ),
            ),
            isEmpty? Lottie.asset(Assets.imagesEmptyLottie,animate: true):
             Expanded(
                child: PopularShoesGridView(
              getPopularShoes:searchedList,
            ))
          ],
        ),
      ),
    );
  }
}
