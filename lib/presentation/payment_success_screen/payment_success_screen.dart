import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/e_ticket_screen/e_ticket_screen.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentSuccessScreen extends StatefulWidget {
  PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  TextEditingController selectTransferSourceController =
  TextEditingController();
  TextEditingController cardholderNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  DateTime? selectedDate;

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  bool isPopupVisible = false;
  bool isImage1 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 19),
              _buildSectionPaymentMethod(context),
              SizedBox(height: 3),
              _buildOne(context),
              SizedBox(height: 11),
              SizedBox(
                height: 440.h,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomElevatedButton(
                      width: 315.v,
                      text: "Pay Now    |   990 DZ",
                      margin: EdgeInsets.only(bottom: 15),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL12,
                      buttonTextStyle:
                      CustomTextStyles.titleMediumWhiteA700SemiBold,
                      alignment: Alignment.bottomCenter,
                      onPressed: () {
                        setState(() {
                          _showDownloadETicketPopup(context);
                        });
                      },
                    ),
                    _buildInputPaymentDetails(context),
                    if (isPopupVisible) _buildPopupPaymentSuccessful(context),
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
              top: 4.v,
              bottom: 4.v,
            ),
            child: Text(
              "Change",

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
              hintText: "EDAHABIA",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 11.v),
            Text(
              "Cardholder Name",
              style: theme.textTheme.labelLarge,
            ),
            CustomTextFormField(
              controller: cardholderNameController,
              hintText: "HAMOU NADIR",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
              textInputAction: TextInputAction.done,
            ),

            SizedBox(height: 8.v),
            Text(
              "Card Number",
              style: theme.textTheme.labelLarge,
            ),
            CustomTextFormField(
              // Assuming cardNumberController is a TextEditingController
              controller: cardNumberController,
              hintText: "**** **** **** 1247",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
              textInputAction: TextInputAction.done,
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
                        GestureDetector(
                          onTap: () {
                            _showDatePicker(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              selectedDate != null
                                  ? DateFormat("dd MMM yyyy").format(selectedDate!)
                                  : "Select Date",
                              style: TextStyle(
                                fontSize: 16,
                                color: selectedDate != null ? Colors.white : Colors.white,
                              ),
                            ),
                          ),
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
                        CustomTextFormField(
                          // Assuming cvvController is a TextEditingController
                          controller: cvvController,
                          hintText: "123",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                          textInputAction: TextInputAction.done,
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


  Widget _buildPopupPaymentSuccessful(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: AppDecoration.fillBlue.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 43.h),
              Container(
                width: 250.v,
                margin: EdgeInsets.only(
                  left: 31.v,
                  right: 33.h,
                ),
                child: Text(
                  "Your Payment was successful",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 302.v,
                child: ReadMoreText(
                  "Adele is a Scottish heiress whose extremely\nwealthy family owns estates and grounds.\nWhen she was a teenager. ",
                  trimLines: 3,
                  colorClickableText: appTheme.whiteA70001,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Read More",
                  moreStyle: CustomTextStyles.bodyMediumPoppinsLight.copyWith(
                    height: 1.57.h,
                  ),
                  lessStyle: CustomTextStyles.bodyMediumPoppinsLight.copyWith(
                    height: 1.57.h,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomElevatedButton(
                text: "See E-Ticket",
                buttonStyle: CustomButtonStyles.outlinePrimaryTL121,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ETicketScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 112.adaptSize,
            width: 112.adaptSize,
            margin: EdgeInsets.only(bottom: 293.h),
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 29.h,
            ),
            decoration: AppDecoration.outlineWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder56,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 46.h,
              width: 39.v,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }


  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
  void _showDownloadETicketPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Set the background color to be transparent
      builder: (BuildContext context) {
        return _buildPopupPaymentSuccessful(context);
      },
    );
  }
}