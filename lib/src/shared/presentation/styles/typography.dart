import 'package:app/src/shared/presentation/provider/theme_provider.dart';
import 'package:app/src/utils/device_dimensions_utils.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static double responsiveFontSize(double fontSize) {
    final double screenWidth = DeviceDimensions.screenWidth;
    const double baseWidthResolution = 428.0;

    // Calcule o fator de escala com base na proporção da largura da tela para a largura base
    double scaleFactor = screenWidth / baseWidthResolution;

    // Garanta que o fator de escala esteja entre 0.7 e 1.3
    scaleFactor = scaleFactor.clamp(0.7, 1.3);

    return fontSize * scaleFactor;
  }

  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.titleFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.titleFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle titleBold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.titleFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle value(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.headlineFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle headline(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.headlineFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.headlineText,
    );
  }

  static TextStyle headlineMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.headlineFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.headlineText,
    );
  }

  static TextStyle headlineBold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.headlineFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.headlineText,
    );
  }

  static TextStyle headlinePrimary(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.headlineFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).appColors.primary,
    );
  }

  static TextStyle bodyRegularExtraLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyRegularLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.largeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyRegularMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyRegularSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyRegularExtraSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraSmallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyMediumExtraLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyMediumLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.largeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyMediumMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyMediumSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyMediumExtraSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraSmallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyBoldExtraLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyBoldLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.largeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyBoldMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyBoldSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyBoldExtraSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraSmallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyExtraBoldExtraLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyExtraBoldLarge(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.largeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyExtraBoldMedium(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyExtraBoldSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle bodyExtraBoldExtraSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraSmallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w900,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle button(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.largeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.onPrimaryContainer,
    );
  }

  static TextStyle buttonSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.onPrimaryContainer,
    );
  }

  static TextStyle buttonExtraSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraSmallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.onPrimaryContainer,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle infoTitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle infoLabel(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body2Text,
    );
  }

  static TextStyle infoItem(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body3Text,
    );
  }

  static TextStyle infoTitleSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle infoLabelSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body2Text,
    );
  }

  static TextStyle infoItemSmall(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body3Text,
    );
  }

  static TextStyle inputLabel(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.onBackground,
    );
  }

  static TextStyle inputError(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).appColors.error,
    );
  }

  static TextStyle inputHint(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.inputHint,
    );
  }

  static TextStyle inputText(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.mediumFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.inputText,
    );
  }

  static TextStyle appBarTitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.titleFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).themeColors.appBarTitle,
    );
  }

  static TextStyle appBarSubtitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.appBarSubtitle,
    );
  }

  static TextStyle popUpDescription(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.smallFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w400,
      color: ThemeProvider.of(context).themeColors.body3Text,
    );
  }

  static TextStyle loginGreetings(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w600,
      color: ThemeProvider.of(context).themeColors.body1Text,
    );
  }

  static TextStyle loginName(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(ThemeProvider.of(context).sizes.extraLargeFontSize),
      fontFamily: ThemeProvider.of(context).typography.fontFamily,
      fontWeight: FontWeight.w800,
      color: ThemeProvider.of(context).appColors.primary,
    );
  }
}
