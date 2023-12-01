import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:readmore/readmore.dart';

class DownloadETicketScreen extends StatelessWidget {
  const DownloadETicketScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 29.v),
          child: Column(
            children: [
              _buildBtnBackColumn(context),
              SizedBox(
                height: 527.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _buildFilmShangChiHorizontalScroll(context),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        color: theme.colorScheme.onPrimaryContainer
                            .withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Container(
                          height: mediaQueryData.size.height,
                          width: double.maxFinite,
                          decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              //_buildPopupColumn(context),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 112.adaptSize,
                                  width: 112.adaptSize,
                                  margin: EdgeInsets.only(bottom: 293.v),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 33.h,
                                    vertical: 29.v,
                                  ),
                                  decoration:
                                      AppDecoration.outlineWhiteA.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder56,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgDownload,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildDownloadETicketButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBtnBackColumn(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          height: 30.v,
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
            text: "E-Ticket",
          ),
        ),
        SizedBox(height: 30.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30.h),
            child: Text(
              "Instruction",
              style: CustomTextStyles.titleLarge_1,
            ),
          ),
        ),
        SizedBox(height: 12.v),
        Container(
          width: 315.h,
          margin: EdgeInsets.symmetric(horizontal: 30.h),
          child: Text(
            "Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: CustomTextStyles.bodyMediumPoppinsBluegray200Light.copyWith(
              height: 1.57,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFilmShangChiHorizontalScroll(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 30.h,
          top: 39.v,
          bottom: 44.v,
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 19.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgETicket1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 34.h,
                        ),
                        child: _buildFilmShangChi(
                          context,
                          filmShangChiText: "Film: Shang-Chi",
                          eTicketText: "e-ticket",
                        ),
                      ),
                      SizedBox(height: 27.v),
                      Container(
                        width: 207.h,
                        margin: EdgeInsets.only(
                          left: 8.h,
                          right: 56.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 3.v),
                                  Text(
                                    "06/09/2021",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seats",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "c4, c5",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 28.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 39.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "Viva Cinema",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                            _buildNineteen(
                              context,
                              orderLabel: "Time",
                              orderValue: "01.00 PM",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 40.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 1.v),
                                  Text(
                                    "Successful",
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  "1904566",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 49.v),
                      Divider(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                      ),
                      SizedBox(height: 28.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcode,
                        height: 66.v,
                        width: 250.h,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 19.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgETicket1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 34.h,
                        ),
                        child: _buildFilmShangChi(
                          context,
                          filmShangChiText: "Film: Shang-Chi",
                          eTicketText: "e-ticket",
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 52.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "06/09/2021",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seats",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "c4, c5",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 33.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "Viva Cinema",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "01.00 PM",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 39.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  "Successful",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                            _buildNineteen(
                              context,
                              orderLabel: "Order",
                              orderValue: "1904566",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 49.v),
                      Divider(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                      ),
                      SizedBox(height: 28.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcode,
                        height: 66.v,
                        width: 250.h,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
/*  Widget _buildPopupColumn(BuildContext context) {
    return Align(
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
            SizedBox(height: 43.v),
            Container(
              width: 250.v,
              margin: EdgeInsets.only(
                left: 31.h,
                right: 33.h,
              ),
              child: Text(
                "Your ticket has been downloaded",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 16.v),
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
              text: "Back To Home",
              buttonStyle: CustomButtonStyles.outlinePrimaryTL121,
            ),
          ],
        ),
      ),
    );
  }*/

  /// Section Widget
  Widget _buildDownloadETicketButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Download E-Ticket",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 29.v,
      ),
    );
  }

  /// Common widget
  Widget _buildFilmShangChi(
    BuildContext context, {
    required String filmShangChiText,
    required String eTicketText,
  }) {
    return Row(
      children: [
        Text(
          filmShangChiText,
          style: CustomTextStyles.titleMediumBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(
            eTicketText,
            style: CustomTextStyles.titleMediumRed40002.copyWith(
              color: appTheme.red40002,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildNineteen(
    BuildContext context, {
    required String orderLabel,
    required String orderValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderLabel,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray60004,
          ),
        ),
        SizedBox(height: 4.v),
        Text(
          orderValue,
          style: CustomTextStyles.titleSmallBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
