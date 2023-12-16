import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopmoviessectionItemWidget extends StatelessWidget {
  const TopmoviessectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle432250x190,
            height: 250.v,
            width: 190.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            "No Time To Die",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 4.v),
          CustomRatingBar(
            ignoreGestures: true,
            initialRating: 5,
          ),
        ],
      ),
    );
  }
}
