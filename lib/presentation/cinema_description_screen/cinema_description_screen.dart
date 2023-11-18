import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:abdenour_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CinemaDescriptionScreen extends StatelessWidget {
  const CinemaDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 97.h),
                          child: Text("TMV Cinema",
                              style: CustomTextStyles.titleLargeBold)),
                      SizedBox(height: 34.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle432268x251,
                          height: 268.v,
                          width: 251.h,
                          radius: BorderRadius.circular(20.h),
                          margin: EdgeInsets.only(left: 37.h)),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 66.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomIconButton(
                                    height: 48.adaptSize,
                                    width: 48.adaptSize,
                                    padding: EdgeInsets.all(12.h),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgTicket)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.h, top: 11.v, bottom: 15.v),
                                    child: Text("Garden City,Cheraga, Algiers",
                                        style:
                                            CustomTextStyles.bodyMediumPoppins))
                              ])),
                      SizedBox(height: 21.v),
                      _buildYourTicketWithRoomsWithCapacity(context),
                      SizedBox(height: 14.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("Description",
                              style: CustomTextStyles.titleLargeMedium)),
                      SizedBox(height: 9.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 315.h,
                              margin: EdgeInsets.only(left: 9.h, right: 17.h),
                              child: Text(
                                  "TMV garden city is big cinema located on a big Center which is Garden City, Cheraga, Algiers It Contains 3 Rooms With ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: CustomTextStyles
                                      .bodyMediumPoppinsGray60003
                                      .copyWith(height: 1.57)))),
                      SizedBox(height: 2.v)
                    ])),
            bottomNavigationBar: _buildAvailableMovies(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBtnBack,
            margin: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 14.v)),
        centerTitle: true,
        title: AppbarTitle(text: "Details Cinema"));
  }

  /// Section Widget
  Widget _buildYourTicketWithRoomsWithCapacity(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(imagePath: ImageConstant.imgTicket48x48)),
          Padding(
              padding: EdgeInsets.only(left: 14.h, top: 11.v, bottom: 16.v),
              child: Text("3 rooms With Capacity of  :600 people  ",
                  style: CustomTextStyles.bodyMediumPoppins))
        ]));
  }

  /// Section Widget
  Widget _buildAvailableMovies(BuildContext context) {
    return CustomElevatedButton(
        text: "Available Movies",
        margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 28.v),
        buttonStyle: CustomButtonStyles.fillBlueTL12,
        buttonTextStyle: CustomTextStyles.titleMedium18,
        onPressed: () {
          onTapAvailableMovies(context);
        });
  }

  /// Navigates to the sessionpercinemaScreen when the action is triggered.
  onTapAvailableMovies(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sessionpercinemaScreen);
  }
}
