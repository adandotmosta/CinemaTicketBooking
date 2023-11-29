import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_icon_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController personalDataController = TextEditingController();

  TextEditingController notificationController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 18.v,
          ),
          child: Column(
            children: [
              _buildProfileSection(context),
              SizedBox(height: 34.v),
              Divider(
                color: appTheme.whiteA70001.withOpacity(0.3),
              ),
              SizedBox(height: 18.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 11.v),
              CustomTextFormField(
                controller: personalDataController,
                hintText: "Personal Data",
                prefix: Container(
                  padding: EdgeInsets.all(12.h),
                  margin: EdgeInsets.only(right: 14.h),
                  decoration: BoxDecoration(
                    color: appTheme.indigoA200,
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgActivity,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.v,
                ),
                suffix: Container(
                  margin: EdgeInsets.only(
                    left: 30.h,
                    top: 11.v,
                    bottom: 11.v,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBtnBackWhiteA70001,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 48.v,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 9.v),
              ),
              SizedBox(height: 22.v),
              _buildDeactiveAccount(
                context,
                deactiveAccount: "Email & Payment",
              ),
              SizedBox(height: 22.v),
              _buildDeactiveAccount(
                context,
                deactiveAccount: "Deactive Account",
              ),
              SizedBox(height: 34.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Divider(
                  color: appTheme.whiteA70001.withOpacity(0.3),
                  endIndent: 10.h,
                ),
              ),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Privacy & Policy",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 10.v),
              CustomTextFormField(
                controller: notificationController,
                hintText: "Notification",
                textInputAction: TextInputAction.done,
                prefix: Container(
                  padding: EdgeInsets.all(12.h),
                  margin: EdgeInsets.only(right: 14.h),
                  decoration: BoxDecoration(
                    color: appTheme.indigoA200,
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNotification,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 48.v,
                ),
                suffix: Container(
                  margin: EdgeInsets.only(
                    left: 30.h,
                    top: 11.v,
                    bottom: 11.v,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBtnBackWhiteA70001,
                    height: 26.adaptSize,
                    width: 26.adaptSize,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 48.v,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 9.v),
              ),
              SizedBox(height: 22.v),
              _buildDeactiveAccount(
                context,
                deactiveAccount: "Your Ticket",
              ),
              SizedBox(height: 22.v),
              _buildDeactiveAccount(
                context,
                deactiveAccount: "Logout",
              ),
              SizedBox(height: 6.v),
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
          top: 13.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Settings",
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgProfile,
          height: 48.adaptSize,
          width: 48.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Miles Morales",
                style: CustomTextStyles.titleMedium18,
              ),
              Text(
                "Film Hunter",
                style: CustomTextStyles.titleSmallGray400,
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgBtnBackWhiteA70001,
          height: 26.adaptSize,
          width: 26.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 11.v),
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
  Widget _buildDeactiveAccount(
    BuildContext context, {
    required String deactiveAccount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 48.adaptSize,
          width: 48.adaptSize,
          padding: EdgeInsets.all(12.h),
          decoration: IconButtonStyleHelper.fillRedTL10,
          child: CustomImageView(
            imagePath: ImageConstant.imgDelete,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 9.v,
            bottom: 11.v,
          ),
          child: Text(
            deactiveAccount,
            style: CustomTextStyles.titleMedium18.copyWith(
              color: appTheme.whiteA70001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgBtnBackWhiteA70001,
          height: 26.adaptSize,
          width: 26.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 11.v),
        ),
      ],
    );
  }
}
