import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController selectTransferSourceController =
      TextEditingController();

  TextEditingController cardholderNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  TextEditingController tbCVVController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 19.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentMethod(context),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Payment Details",
                  style: CustomTextStyles.titleLarge_1,
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Transfer Source",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(height: 8.v),
              _buildSelectTransferSource(context),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Cardholder Name",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(height: 8.v),
              _buildCardholderName(context),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Price",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(height: 8.v),
              _buildPrice(context),
              SizedBox(height: 11.v),
              _buildPrice1(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBtnPayNow(context),
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
  Widget _buildPaymentMethod(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 224.v,
        width: 347.h,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  bottom: 9.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 185.v),
                      child: Text(
                        "Payment Method",
                        style: CustomTextStyles.titleLarge_1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 2.v,
                        right: 30.h,
                        bottom: 191.v,
                      ),
                      child: Text(
                        "Change",
                        style: CustomTextStyles.bodyMediumPoppinsBluegray200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img2,
                      height: 190.v,
                      width: 301.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.img1,
                      height: 190.v,
                      width: 301.h,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                      margin: EdgeInsets.only(top: 1.v),
                    ),
                  ],
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgMarwene1,
              height: 190.v,
              width: 32.h,
              radius: BorderRadius.circular(
                15.h,
              ),
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(bottom: 1.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectTransferSource(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: CustomTextFormField(
        controller: selectTransferSourceController,
        hintText: "Select the transfer source",
        hintStyle: CustomTextStyles.labelLargeBluegray200,
        alignment: Alignment.center,
      ),
    );
  }

  /// Section Widget
  Widget _buildCardholderName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: CustomTextFormField(
        controller: cardholderNameController,
        hintText: "Nadir Hammou          ",
        hintStyle: CustomTextStyles.labelLargeBluegray200,
        alignment: Alignment.center,
      ),
    );
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: CustomTextFormField(
        controller: priceController,
        hintText: "beneficiary PR account",
        hintStyle: CustomTextStyles.labelLargeBluegray200,
        alignment: Alignment.center,
      ),
    );
  }

  /// Section Widget
  Widget _buildTbCVV(BuildContext context) {
    return CustomTextFormField(
      width: 141.h,
      controller: tbCVVController,
      hintText: "**** DA",
      hintStyle: CustomTextStyles.labelLargeBluegray200,
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildPrice1(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
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
                        margin: EdgeInsets.fromLTRB(3.h, 16.v, 24.h, 16.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdown,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      hintText: "02 Nov 2024",
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
                      "Price",
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.v),
                    _buildTbCVV(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBtnPayNow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 86.h,
        right: 63.h,
        bottom: 40.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.v),
            child: Text(
              "Pay Now",
              style: CustomTextStyles.titleMediumWhiteA700,
            ),
          ),
          Spacer(),
          SizedBox(
            height: 32.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: appTheme.whiteA70001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 28.h,
              top: 2.v,
              bottom: 2.v,
            ),
            child: Text(
              "900 DA",
              style: CustomTextStyles.titleMediumWhiteA700SemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
