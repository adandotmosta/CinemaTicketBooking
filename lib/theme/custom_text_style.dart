import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsBluegray200 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsBluegray20002 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.blueGray20002,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsBluegray200Light =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsGray400 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray400,
      );
  static get bodyMediumPoppinsGray60002 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray60002,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsGray60003 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray60003,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsLight =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsPrimaryContainer =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallBlue400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue400,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallBluegray200 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 10.fSize,
      );
  static get bodySmallGray90003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90003,
        fontSize: 10.fSize,
      );
  static get bodySmallRegular => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeBluegray200 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray200,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeLailaBlack900 =>
      theme.textTheme.labelLarge!.laila.copyWith(
        color: appTheme.black900,
      );
  static get labelLargePTRootUIBluegray200 =>
      theme.textTheme.labelLarge!.pTRootUI.copyWith(
        color: appTheme.blueGray200,
      );
  static get labelLargePTRootUIBluegray500 =>
      theme.textTheme.labelLarge!.pTRootUI.copyWith(
        color: appTheme.blueGray500,
      );
  static get labelLargeWhiteA70001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA70001.withOpacity(0.8),
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumGray90003 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90003,
      );
  // Title text style
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeGray100 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray100,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeLailaIndigo900 =>
      theme.textTheme.titleLarge!.laila.copyWith(
        color: appTheme.indigo900,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargeMedium21 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 21.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLarge_1 => theme.textTheme.titleLarge!;
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRed400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red400,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRed40002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red40002,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get titleMediumWhiteA700Bold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallGray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray400Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray60001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallWhiteA70001Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallWhiteA70001Medium =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA70001Medium_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA70001Medium_2 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001.withOpacity(0.5),
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get laila {
    return copyWith(
      fontFamily: 'Laila',
    );
  }

  TextStyle get pTRootUI {
    return copyWith(
      fontFamily: 'PT Root UI',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
