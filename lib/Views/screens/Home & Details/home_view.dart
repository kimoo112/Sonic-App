import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Helpers/navigate.dart';
import '../Home%20&%20Details/all_popular_shoes.dart';
import '../../widgets/arrivals_container.dart';
import '../../widgets/badge_icon.dart';
import '../../widgets/custom_searchbar.dart';
import '../../widgets/logout_button.dart';
import '../../widgets/popular_list_view.dart';
import '../../widgets/see_all.dart';
import '../../widgets/tab_bar.dart';
import '../../../Helpers/colors.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cTransparent,
        scrolledUnderElevation: 0,
        title: Text(
          'Explore',
          style: TextStyle(
              color: cBackGround, fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: logoutButton(context,cBackGround),
        actions: [
          BadgeIcon(
            onTap: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Hero(tag: 'null', child: CustomSearchBar()),
              SizedBox(height: 22.h),
              selectCategory(),
              SizedBox(height: 22.h),
              SizedBox(
                child: TabBarWidget(tabController: _tabController),
              ),
              SizedBox(height: 11.h),
              SeeAllRow(
                onPressed: () {
                  getTo(const AllPopular(), context);
                },
              ),
              SizedBox(height: 11.h),
              const PopularListView(),
              const SeeAllRow(
                category: 'New Arrivals',
              ),
              SizedBox(height: 11.h),
              const ArrivalsContainer(),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  Text selectCategory() {
    return const Text(
      'Select Category',
      style: TextStyle(
          letterSpacing: .5, fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}
