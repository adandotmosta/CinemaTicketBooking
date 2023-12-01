import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CinemalistItemWidget extends StatelessWidget {
  const CinemalistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle4323,
            height: 76.adaptSize,
            width: 76.adaptSize,
            radius: BorderRadius.circular(
              12.h,
            ),
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 25.v,
              bottom: 9.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Viva Cinema",
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "Closed 10.00 PM",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
