import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/presentation/movie_sessions_page/movie_sessions_page.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MovieSessionsTabContainerScreen extends StatefulWidget {
  const MovieSessionsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MovieSessionsTabContainerScreenState createState() =>
      MovieSessionsTabContainerScreenState();
}

class MovieSessionsTabContainerScreenState
    extends State<MovieSessionsTabContainerScreen>
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
        backgroundColor: appTheme.gray90001,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildFixed(context),
              Expanded(
                child: SizedBox(
                  height: 656.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      MovieSessionsPage(),
                      MovieSessionsPage(),
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
  Widget _buildFixed(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnPrimaryContainer1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 29.v),
          CustomAppBar(
            height: 30.v,
            leadingWidth: 55.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgBtnBack,
              margin: EdgeInsets.only(
                left: 29.h,
                bottom: 3.v,
              ),
            ),
            centerTitle: true,
            title: AppbarTitle(
              text: "Shang -Chi",
            ),
          ),
          SizedBox(height: 60.v),
          Container(
            height: 36.v,
            width: double.maxFinite,
            child: TabBar(
              controller: tabviewController,
              isScrollable: true,
              labelColor: appTheme.red400,
              unselectedLabelColor: appTheme.whiteA70001,
              indicatorColor:
                  theme.colorScheme.onPrimaryContainer.withOpacity(1),
              tabs: [
                Tab(
                  child: Text(
                    "About",
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: AppDecoration.outlineDeepOrangeF,
                    child: Text(
                      "Sessions",
                    ),
                  ),
                ),
              ],
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
