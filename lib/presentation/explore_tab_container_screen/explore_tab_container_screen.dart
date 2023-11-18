import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/presentation/explore_page/explore_page.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ExploreTabContainerScreen extends StatefulWidget {
  const ExploreTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ExploreTabContainerScreenState createState() =>
      ExploreTabContainerScreenState();
}

class ExploreTabContainerScreenState extends State<ExploreTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 17.v),
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 576.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      ExplorePage(),
                      ExplorePage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBtnBack,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 15.v,
          bottom: 14.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Available movies",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchWhiteA70001,
          margin: EdgeInsets.fromLTRB(30.h, 16.v, 30.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 64.v,
      width: 315.h,
      decoration: BoxDecoration(
        color: appTheme.blueGray90001,
        borderRadius: BorderRadius.circular(
          12.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA70001,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: appTheme.whiteA70001.withOpacity(0.5),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        indicatorPadding: EdgeInsets.all(
          10.0.h,
        ),
        indicator: BoxDecoration(
          color: appTheme.blue400,
          borderRadius: BorderRadius.circular(
            6.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Now Showing",
            ),
          ),
          Tab(
            child: Text(
              "Upcoming",
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
