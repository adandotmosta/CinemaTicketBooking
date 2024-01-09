import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SessionlistItemWidget extends StatelessWidget {
  final bool showAdditionalInfo;
  final String filmImage;
  final String MovieName;
  final String version;
  final String sessionTime;
  final String price;
  final int remainingPlaces;
  final int RoomNumber;
  final int session_id;
  final int room_id;


  const SessionlistItemWidget({
    Key? key,
    required this.showAdditionalInfo,
    required this.filmImage,
    required this.MovieName,
    required this.version,
    required this.sessionTime,
    required this.price,
    required this.remainingPlaces,
    required this.RoomNumber,
    required this.session_id,
    required this.room_id

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(left: 29.h, right: 29.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.selectSeatsScreen, arguments: { 'room_id' : room_id, 'Session_id' :session_id});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    filmImage,
                    height: 200.v,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 12.v),
                  if (showAdditionalInfo)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$MovieName",
                          style: CustomTextStyles.titleSmallWhiteA70001Bold,
                        ),
                        SizedBox(height: 6.v),
                        Text(
                          "Session Time: $sessionTime",
                          style: CustomTextStyles.bodySmallGray600,
                        ),
                        SizedBox(height: 6.v),
                        Text(
                          "Version: $version",
                          style: CustomTextStyles.bodySmallGray600,
                        ),
                        SizedBox(height: 6.v),
                        Text(
                          "Price: $price", // replace with actual price
                          style: CustomTextStyles.bodySmallGray600,
                        ),
                       /* SizedBox(height: 6.v),
                        Text(
                          "Remaining Places: $remainingPlaces", // replace with actual count
                          style: CustomTextStyles.bodySmallGray600,
                        ),*/
                        SizedBox(height: 6.v),
                        Text(
                          "Room number: $RoomNumber", // replace with actual count
                          style: CustomTextStyles.bodySmallGray600,
                        ),

                      ],
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
