import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SavedPlanScreen extends StatelessWidget {
  SavedPlanScreen({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList1 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList2 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList3 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList4 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList5 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList6 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList7 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
              SizedBox(height: 16.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 38.h),
                            child: Text(
                              "02 November 2024",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ),
                        SizedBox(height: 18.v),
                        _buildMovie1(context),
                        SizedBox(height: 17.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cinema",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        CustomDropDown(
                          icon: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdown,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                            ),
                          ),
                          hintText: "EbonyLife",
                          items: dropdownItemList,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 11.v),
                        _buildDate(context),
                        SizedBox(height: 11.v),
                        _buildSeats(context),
                        SizedBox(height: 24.v),
                        _buildCheckout(context),
                        SizedBox(height: 35.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(right: 91.h),
                            child: Row(
                              children: [
                                Text(
                                  "2.",
                                  style: theme.textTheme.titleLarge,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 21.h),
                                  child: Text(
                                    "17 December 2024",
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18.v),
                        _buildMovie2(context),
                        SizedBox(height: 17.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cinema",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        CustomDropDown(
                          icon: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdown,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                            ),
                          ),
                          hintText: "Empire XXI Yogyakarta",
                          items: dropdownItemList4,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 12.v),
                        _buildDate1(context),
                        SizedBox(height: 12.v),
                        _buildSeats1(context),
                        SizedBox(height: 24.v),
                        _buildCheckout1(context),
                      ],
                    ),
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
        text: "Saved Plan",
      ),
    );
  }

  /// Section Widget
  Widget _buildMovie1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle4327,
          height: 76.adaptSize,
          width: 76.adaptSize,
          radius: BorderRadius.circular(
            12.h,
          ),
        ),
        Container(
          height: 64.v,
          width: 121.h,
          margin: EdgeInsets.only(
            left: 12.h,
            top: 3.v,
            bottom: 8.v,
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Action",
                      style: CustomTextStyles.bodySmallBlue400,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "No Time To Die",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "2h 43m",
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgStar518x18,
          height: 18.adaptSize,
          width: 18.adaptSize,
          radius: BorderRadius.circular(
            1.h,
          ),
          margin: EdgeInsets.only(
            top: 30.v,
            bottom: 28.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 2.h,
            top: 29.v,
            bottom: 25.v,
          ),
          child: Text(
            "5,0",
            style: CustomTextStyles.bodyMediumPoppinsBluegray20002,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(7.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "02 Nov 2024",
              items: dropdownItemList1,
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 147.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(29.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "01.00 PM",
              items: dropdownItemList2,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seats",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(18.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "C4, C5, C6",
              items: dropdownItemList3,
              onChanged: (value) {},
            ),
          ],
        ),
        _buildTime(
          context,
          userName: "Person",
          two: "2",
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            text: "Checkout",
            margin: EdgeInsets.only(bottom: 1.v),
          ),
        ),
        Container(
          height: 58.v,
          width: 64.h,
          margin: EdgeInsets.only(left: 20.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgDelete,
            height: 32.adaptSize,
            width: 32.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMovie2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 76.adaptSize,
          width: 76.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.blueGray90001,
            borderRadius: BorderRadius.circular(
              12.h,
            ),
          ),
        ),
        Container(
          height: 65.v,
          width: 127.h,
          margin: EdgeInsets.only(
            left: 12.h,
            top: 3.v,
            bottom: 6.v,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Crime",
                      style: CustomTextStyles.bodySmallBlue400,
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      "Money Heist",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "5 Season, 50 Episode",
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgStar51,
          height: 18.adaptSize,
          width: 18.adaptSize,
          radius: BorderRadius.circular(
            1.h,
          ),
          margin: EdgeInsets.only(
            top: 30.v,
            bottom: 28.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 2.h,
            top: 29.v,
            bottom: 25.v,
          ),
          child: Text(
            "5,0",
            style: CustomTextStyles.bodyMediumPoppinsBluegray20002,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDate1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(7.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "02 Nov 2021",
              items: dropdownItemList5,
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 147.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(27.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "01.00 PM",
              items: dropdownItemList6,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeats1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seats",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(14.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "C4, C5, C6",
              items: dropdownItemList7,
              onChanged: (value) {},
            ),
          ],
        ),
        _buildTime(
          context,
          userName: "Person",
          two: "2",
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCheckout1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            text: "Checkout",
          ),
        ),
        Container(
          height: 58.v,
          width: 64.h,
          margin: EdgeInsets.only(left: 20.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgDelete,
            height: 32.adaptSize,
            width: 32.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

  /// Common widget
  Widget _buildTime(
    BuildContext context, {
    required String userName,
    required String two,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: theme.textTheme.labelLarge!.copyWith(
            color: appTheme.whiteA70001,
          ),
        ),
        SizedBox(height: 8.v),
        Container(
          width: 147.h,
          padding: EdgeInsets.symmetric(vertical: 12.v),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgFloatingIcon,
                height: 22.adaptSize,
                width: 22.adaptSize,
                radius: BorderRadius.circular(
                  11.h,
                ),
              ),
              Text(
                two,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallWhiteA70001Medium_1.copyWith(
                  color: appTheme.whiteA70001,
                ),
              ),
              Container(
                height: 22.adaptSize,
                width: 22.adaptSize,
                padding: EdgeInsets.all(5.h),
                decoration: AppDecoration.fillBlue.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgPlus,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
