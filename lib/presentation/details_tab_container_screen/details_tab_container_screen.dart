import '../details_tab_container_screen/widgets/chipviewwidget_item_widget.dart';
import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/presentation/details_page/details_page.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsTabContainerScreen extends StatefulWidget {
  const DetailsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  DetailsTabContainerScreenState createState() =>
      DetailsTabContainerScreenState();
}

class DetailsTabContainerScreenState extends State<DetailsTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

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
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 617.v,
                width: 374.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHorizontalScrollWidget(context),
                          SizedBox(height: 14.v),
                          Text(
                            "Shang - Chi",
                            style: CustomTextStyles.titleLargeMedium,
                          ),
                          SizedBox(height: 2.v),
                          Padding(
                            padding: EdgeInsets.only(right: 76.h),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.v),
                                  child: Text(
                                    "Director: Destin Daniel Cretton",
                                    style: CustomTextStyles
                                        .bodyMediumPoppinsBluegray20002,
                                  ),
                                ),
                                Container(
                                  height: 14.v,
                                  width: 1.h,
                                  margin: EdgeInsets.only(
                                    left: 8.h,
                                    top: 3.v,
                                    bottom: 4.v,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.gray60003,
                                    borderRadius: BorderRadius.circular(
                                      1.h,
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgStar5,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize,
                                  radius: BorderRadius.circular(
                                    1.h,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 8.h,
                                    bottom: 1.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    "4,9",
                                    style: CustomTextStyles
                                        .bodyMediumPoppinsBluegray20002,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 11.v),
                          _buildChipViewWidget(context),
                        ],
                      ),
                    ),
                    _buildAppBarWidget(context),
                    _buildFixedWidget(context),
                  ],
                ),
              ),
              SizedBox(
                height: 656.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    DetailsPage(),
                    DetailsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScrollWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle432370x251,
              height: 370.v,
              width: 251.h,
              radius: BorderRadius.circular(
                20.h,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgRectangle432370x251,
              height: 370.v,
              width: 251.h,
              radius: BorderRadius.circular(
                20.h,
              ),
              margin: EdgeInsets.only(left: 24.h),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChipViewWidget(BuildContext context) {
    return Wrap(
      runSpacing: 12.v,
      spacing: 12.h,
      children: List<Widget>.generate(3, (index) => ChipviewwidgetItemWidget()),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBarWidget(BuildContext context) {
    return CustomAppBar(
      height: 59.v,
      leadingWidth: 56.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBtnBack,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 2.v,
          bottom: 1.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Details Movie",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgBookmark,
          margin: EdgeInsets.fromLTRB(30.h, 3.v, 30.h, 2.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFixedWidget(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: AppDecoration.fillOnPrimaryContainer1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 29.v),
            Padding(
              padding: EdgeInsets.only(left: 30.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBtnBack,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                    margin: EdgeInsets.only(bottom: 3.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 74.h),
                    child: Text(
                      "Shang - Chi",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.v),
            Container(
              height: 36.v,
              width: 374.h,
              child: TabBar(
                controller: tabviewController,
                isScrollable: true,
                indicatorColor: appTheme.blue30019,
                tabs: [
                  Tab(
                    child: Container(
                      decoration: AppDecoration.outlineDeepOrangeF,
                      child: Text(
                        "About",
                      ),
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
      ),
    );
  }
}
