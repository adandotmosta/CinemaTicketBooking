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
                  Column(
                    children: [
                      Text(
                        "14:40",
                        style: CustomTextStyles.titleMediumBold18,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        "Рус",
                        style: CustomTextStyles.labelLargePTRootUIBluegray500,
                      ),
                    ],
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
                          "Eurasia Cinema7",
                          style: CustomTextStyles.titleSmallWhiteA70001Bold,
                        ),
                        SizedBox(height: 6.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2200 ₸",
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              "1000 ₸",
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              "1500 ₸",
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              "•",
                              style: CustomTextStyles.bodyMediumBluegray500,
                            ),
                          ],
                        ),
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
