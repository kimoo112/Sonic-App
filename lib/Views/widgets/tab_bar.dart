
import 'package:flutter/material.dart';

import '../../Helpers/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        dividerColor: cLight,
        splashBorderRadius: BorderRadius.circular(15),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: cLight,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w600, letterSpacing: .3),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: cBackGround),
        controller: _tabController,
        tabs:  [
          Tab(
            text: 'All Shoes'.toUpperCase(),
          ),
          Tab(
            text: 'Outdoor'.toUpperCase(),
          ),
          Tab(
            text: 'Tennis'.toUpperCase(),
          ),
        ]);
  }
}
