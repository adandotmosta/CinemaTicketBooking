import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:abdenour_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:abdenour_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:abdenour_s_application1/widgets/custom_drop_down.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:abdenour_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PaymentSuccessScreen extends StatelessWidget {
  PaymentSuccessScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController selectTransferSourceController =
      TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 19.v),
              _buildSectionPaymentMethod(context),
              SizedBox(height: 3.v),
              _buildOne(context),
              SizedBox(height: 11.v),
              SizedBox(
                height: 486.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomElevatedButton(
                      width: 315.h,
                      text: "99.8",
                      margin: EdgeInsets.only(bottom: 28.v),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL12,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumWhiteA700SemiBold,
                      alignment: Alignment.bottomCenter,
                    ),
                    _buildInputPaymentDetails(context),
                    _buildPopupPaymentSuccessful(context),
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
        text: "Checkout",
      ),
    );
  }

  /// Section Widget
  Widget _buildSectionPaymentMethod(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: CustomTextStyles.titleLarge_1,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,
              bottom: 6.v,
            ),
            child: Text(
              "Change",
              style: CustomTextStyles.bodyMediumPoppinsBluegray200,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 28.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img1,
              height: 190.v,
              width: 301.h,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgMarwene1,
              height: 190.v,
              width: 32.h,
              radius: BorderRadius.circular(
                15.h,
              ),
              margin: EdgeInsets.only(left: 13.h),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInputPaymentDetails(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Details",
              style: CustomTextStyles.titleLarge_1,
            ),
            SizedBox(height: 7.v),
            Text(
              "Transfer Source",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomTextFormField(
              controller: selectTransferSourceController,
              hintText: "Select the transfer source",
              hintStyle: CustomTextStyles.labelLargeBluegray200,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 11.v),
            Text(
              "Cardholder Name",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            Container(
              width: 315.h,
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Text(
                "Miles Morales",
                style: CustomTextStyles.labelLargeBluegray200,
              ),
            ),
            SizedBox(height: 11.v),
            Text(
              "Card Number",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            Container(
              width: 315.h,
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Text(
                "**** **** **** 51446",
                style: CustomTextStyles.labelLargeBluegray200,
              ),
            ),
            SizedBox(height: 11.v),
            Row(
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
                          items: dropdownItemList,
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
                          "CVV",
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 8.v),
                        Container(
                          width: 141.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 23.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                          child: Text(
                            "123",
                            style: CustomTextStyles.labelLargeBluegray200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPopupPaymentSuccessful(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 405.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 389.v,
                width: 361.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    20.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 405.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(30.h),
                        decoration: AppDecoration.fillBlue.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL60,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 46.v),
                            Container(
                              width: 231.h,
                              margin: EdgeInsets.only(
                                left: 41.h,
                                right: 42.h,
                              ),
                              child: Text(
                                "Your payment was successful",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headlineSmall,
                              ),
                            ),
                            SizedBox(height: 14.v),
                            SizedBox(
                              width: 302.h,
                              child: ReadMoreText(
                                "Adele is a Scottish heiress whose extremely\nwealthy family owns estates and grounds.\nWhen she was a teenager. ",
                                trimLines: 3,
                                colorClickableText: appTheme.whiteA70001,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Read More",
                                moreStyle: CustomTextStyles
                                    .bodyMediumPoppinsLight
                                    .copyWith(
                                  height: 1.57,
                                ),
                                lessStyle: CustomTextStyles
                                    .bodyMediumPoppinsLight
                                    .copyWith(
                                  height: 1.57,
                                ),
                              ),
                            ),
                            SizedBox(height: 32.v),
                            CustomElevatedButton(
                              text: "See E-Ticket",
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL121,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 112.adaptSize,
                        width: 112.adaptSize,
                        padding: EdgeInsets.symmetric(
                          horizontal: 33.h,
                          vertical: 29.v,
                        ),
                        decoration: AppDecoration.outlineWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder56,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 46.v,
                          width: 39.h,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
