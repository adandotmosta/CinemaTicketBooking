import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SessionlistItemWidget extends StatelessWidget {
  final bool showAdditionalInfo;

  const SessionlistItemWidget({
    Key? key,
    required this.showAdditionalInfo,
  }) : super(key: key);

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
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.selectSeatsScreen);
                    },
                    child: Column(
                      children: [

                        Image.asset(
                          'assets/images/TMV.jpg', // replace with actual image URL
                          height: 50.v, // adjust height as needed
                          width: 50.h, // adjust width as needed
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
                        if (showAdditionalInfo)
                        // Add additional information widgets here
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Session Time: 14:40",
                                style: CustomTextStyles.bodySmallGray600,
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                "Session Price: \900DA", // replace with actual price
                                style: CustomTextStyles.bodySmallGray600,
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                "Remaining Places: 20", // replace with actual count
                                style: CustomTextStyles.bodySmallGray600,
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
