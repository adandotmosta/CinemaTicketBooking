import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/home_screen/home_screen.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:readmore/readmore.dart';

class ETicketScreen extends StatelessWidget {
  const ETicketScreen({Key? key})
      : super(
          key: key,
        );



  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 17.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.v),
                child: Text(
                  "Instruction",
                  style: CustomTextStyles.titleLarge_1,
                ),
              ),
              SizedBox(height: 12.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 315.v,
                  margin: EdgeInsets.symmetric(horizontal: 30.v),
                  child: Text(
                    "Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: CustomTextStyles.bodyMediumPoppinsBluegray200Light.copyWith(
                      height: 1.57.v,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 39.v),
              _buildFilmShangChi2(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildDownloadETicketButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.v,

      centerTitle: true,
      title: AppbarTitle(
        text: "E-Ticket",
      ),
    );
  }

  /// Section Widget
  Widget _buildFilmShangChi2(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 30.v),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 19.h,
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
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 34.h,
                        ),
                        child: _buildFilmShangChi(
                          context,
                          filmShangChiText: "Film: Shang-Chi",
                          eTicketText: "e-ticket",
                        ),
                      ),
                      SizedBox(height: 27.h),
                      Container(
                        width: 207.v,
                        margin: EdgeInsets.only(
                          left: 8.v,
                          right: 56.v,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 3.h),
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
                                SizedBox(height: 4.h),
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
                      SizedBox(height: 28.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 39.v,
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
                                SizedBox(height: 4.h),
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
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 40.v,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 1.h),
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
                                SizedBox(height: 3.h),
                                Text(
                                  "1904566",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 49.h),
                      Divider(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                      ),
                      SizedBox(height: 28.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcode,
                        height: 66.h,
                        width: 250.v,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.v),
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 19.h,
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
                      SizedBox(height: 9.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 34.v,
                        ),
                        child: _buildFilmShangChi(
                          context,
                          filmShangChiText: "Film: Shang-Chi",
                          eTicketText: "e-ticket",
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 52.v,
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
                                SizedBox(height: 4.h),
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
                                SizedBox(height: 4.h),
                                Text(
                                  "c4, c5",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 33.v,
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
                                SizedBox(height: 4.h),
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
                                SizedBox(height: 4.h),
                                Text(
                                  "01.00 PM",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.v,
                          right: 39.v,
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
                                SizedBox(height: 4.h),
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
                      SizedBox(height: 49.h),
                      Divider(
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                      ),
                      SizedBox(height: 28.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcode,
                        height: 66.h,
                        width: 250.v,
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

  Widget _buildDownloadETicketButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Download E-Ticket",
      margin: EdgeInsets.only(
        left: 30.v,
        right: 30.v,
        bottom: 30.h,
      ),
      onPressed: () {
        _showDownloadETicketPopup(context);
      },
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
          padding: EdgeInsets.only(left: 30.v),
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

  Widget _buildPopupColumn(BuildContext context) {
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
                  "Your ticket has been downloaded",
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
                  "Adele is a Scottish heiress whose extremely\nwealthy family owns estates and grounds.\nWhen she was a teenager.",
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
              imagePath: ImageConstant.imgDownload,
              height: 46.h,
              width: 39.v,
              alignment: Alignment.center,
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
        SizedBox(height: 4.h),
        Text(
          orderValue,
          style: CustomTextStyles.titleSmallBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
  void _showDownloadETicketPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Set the background color to be transparent
      builder: (BuildContext context) {
        return _buildPopupColumn(context);
      },
    );
  }


}



