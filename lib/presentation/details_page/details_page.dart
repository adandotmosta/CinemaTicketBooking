import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

// ignore_for_file: must_be_immutable
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage>
    with AutomaticKeepAliveClientMixin<DetailsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 466.v),
              _buildBookTicket(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBookTicket(BuildContext context) {
    return Container(
      height: 161.v,
      width: 315.h,
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomElevatedButton(
            width: 315.h,
            text: "Book Ticket",
            buttonStyle: CustomButtonStyles.fillBlueTL12,
            buttonTextStyle: CustomTextStyles.titleMedium18,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Synopsis",
                  style: CustomTextStyles.titleLargeMedium,
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 315.h,
                  child: ReadMoreText(
                    "Martial-arts master Shang-Chi confronts the past he thought he left behind when he's drawn into ",
                    trimLines: 3,
                    colorClickableText: appTheme.blue400,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Read More",
                    moreStyle:
                        CustomTextStyles.bodyMediumPoppinsGray60003.copyWith(
                      height: 1.57,
                    ),
                    lessStyle:
                        CustomTextStyles.bodyMediumPoppinsGray60003.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
