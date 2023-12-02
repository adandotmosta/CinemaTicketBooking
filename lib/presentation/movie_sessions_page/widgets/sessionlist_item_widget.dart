import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SessionlistItemWidget extends StatelessWidget {
  const SessionlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 14.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 29.h,
                right: 64.h,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.cinemaDescriptionScreen);
                    },
                    child: Column(
                      children: [
                        Text(
                          "14:40",
                          style: CustomTextStyles.titleMediumBold18,
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          "",
                          style: CustomTextStyles.labelLargePTRootUIBluegray500,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29.h),
                    child: SizedBox(
                      height: 46.v,
                      child: VerticalDivider(
                        width: 1.h,
                        thickness: 1.v,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TMV CINEMA",
                          style: CustomTextStyles.titleSmallWhiteA70001Bold,
                        ),
                        SizedBox(height: 6.v),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Divider(),
        ],
      ),
    );
  }
}
