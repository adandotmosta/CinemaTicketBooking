import '../sessionpercinema_screen/widgets/userprofile_item_widget.dart';
import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SessionpercinemaScreen extends StatelessWidget {
  SessionpercinemaScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 21.v),
                child: Column(children: [
                  SizedBox(height: 154.v),
                  _buildUserProfile(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBtnBack,
            margin: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 14.v)),
        centerTitle: true,
        title: AppbarTitle(text: "Sessions Available"));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1.v);
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return UserprofileItemWidget(onTapImgUserImage: () {
                    onTapImgUserImage(context);
                  });
                })));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the selectSeatsScreen when the action is triggered.
  onTapImgUserImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.selectSeatsScreen);
  }
}
