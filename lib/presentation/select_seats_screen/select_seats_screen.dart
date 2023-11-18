import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_drop_down.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:abdenour_s_application1/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

class SelectSeatsScreen extends StatelessWidget {
  SelectSeatsScreen({Key? key})
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

  String radioGroup = "";

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 17.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Room",
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
                items: dropdownItemList,
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              _buildDateRow(context),
              SizedBox(height: 42.v),
              _buildSeatStack(context),
              SizedBox(height: 46.v),
              _buildInfoSeats(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildCheckoutButton(context),
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
        text: "Select Seats",
      ),
    );
  }

  /// Section Widget
  Widget _buildDateRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                CustomDropDown(
                  width: 141.h,
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(7.h, 16.v, 24.h, 16.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdown,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                  ),
                  hintText: "02 Nov 2021",
                  items: dropdownItemList1,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                CustomDropDown(
                  width: 141.h,
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(26.h, 16.v, 24.h, 16.v),
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
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeatStack(BuildContext context) {
    return SizedBox(
      height: 322.v,
      width: 315.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSeat,
            height: 260.v,
            width: 315.h,
            alignment: Alignment.bottomCenter,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgScreen,
            height: 88.v,
            width: 315.h,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildInfoSeats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10.adaptSize,
          width: 10.adaptSize,
          margin: EdgeInsets.only(
            top: 4.v,
            bottom: 3.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.blue400,
            borderRadius: BorderRadius.circular(
              5.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Selected",
            style: CustomTextStyles.bodySmallBluegray200,
          ),
        ),
        Spacer(
          flex: 54,
        ),
        Container(
          height: 10.adaptSize,
          width: 10.adaptSize,
          margin: EdgeInsets.only(
            top: 4.v,
            bottom: 3.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.red400,
            borderRadius: BorderRadius.circular(
              5.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Reserved",
            style: CustomTextStyles.bodySmallBluegray200,
          ),
        ),
        Spacer(
          flex: 45,
        ),
        CustomRadioButton(
          text: "Available",
          value: "Available",
          groupValue: radioGroup,
          onChange: (value) {
            radioGroup = value;
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCheckoutButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Checkout",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 28.v,
      ),
    );
  }
}
