import 'package:flutter/material.dart';
import 'package:abdenour_s_application1/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue400,
      );
  static BoxDecoration get fillBlueE => BoxDecoration(
        color: appTheme.blue400E8,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90005,
      );
  static BoxDecoration get fillGray90001 => BoxDecoration(
        color: appTheme.gray90001,
      );
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime600,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillOnPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillOrangeA => BoxDecoration(
        color: appTheme.orangeA200,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue400,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray200.withOpacity(0.5),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineDeepOrangeF => BoxDecoration();
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.blue400,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.blue400,
        border: Border.all(
          color: appTheme.whiteA70001,
          width: 3.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder56 => BorderRadius.circular(
        56.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL43 => BorderRadius.vertical(
        top: Radius.circular(43.h),
      );
  static BorderRadius get customBorderTL60 => BorderRadius.only(
        topLeft: Radius.circular(60.h),
        topRight: Radius.circular(60.h),
        bottomLeft: Radius.circular(20.h),
        bottomRight: Radius.circular(20.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
