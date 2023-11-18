import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget({
    Key? key,
    this.onTapImgUserImage,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgUserImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgSession,
          height: 76.v,
          width: 374.h,
          onTap: () {
            onTapImgUserImage!.call();
          },
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 3.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 8.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "14:50",
                  style: CustomTextStyles.labelLargeBold,
                ),
              ),
              Spacer(
                flex: 45,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.v),
                child: Text(
                  "Equalizer3",
                  style: CustomTextStyles.titleSmallWhiteA70001,
                ),
              ),
              Spacer(
                flex: 54,
              ),
              CustomElevatedButton(
                height: 23.v,
                width: 22.h,
                text: "VF",
                margin: EdgeInsets.only(
                  top: 2.v,
                  bottom: 3.v,
                ),
                buttonStyle: CustomButtonStyles.fillBlue,
                buttonTextStyle: theme.textTheme.labelSmall!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
