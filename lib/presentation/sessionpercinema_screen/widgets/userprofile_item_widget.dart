import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget({
    Key? key,
    this.onTapImgUserImage,
    this.movie_title,
    this.movie_lang,
    this.movie_img,
    this.movie_hour,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgUserImage;
  String? movie_title;
  String? movie_hour;
  String? movie_lang;
  String? movie_img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        GestureDetector(
          onTap: (){
            onTapImgUserImage?.call();
          },

          child: Image.network(
              movie_img!,
            height: 150.v,
            fit: BoxFit.cover,
            width: double.maxFinite,

          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                movie_hour!,
                  style: TextStyle(
                  fontSize: 12.adaptSize,
                  fontWeight: FontWeight.bold,
                  ),
              ),
              Text(
                movie_title!,
                style: TextStyle(
                  fontSize: 12.adaptSize,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: movie_lang=="VF" ? Color(0xFF0C2DA5) : Colors.yellow,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    movie_lang!,
                    style: TextStyle(
                        fontSize: 10.adaptSize,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                ),
              )
            ],
          ),



        ),
      ],
    );
  }
}
