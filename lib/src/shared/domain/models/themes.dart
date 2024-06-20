import 'package:flutter/material.dart';

class CustomTheme {
  final AppColors appColors;
  final ThemeColors themeColors;
  final ThemeSizes sizes;
  final ThemeTypography typography;

  CustomTheme({
    required this.appColors,
    required this.themeColors,
    required this.sizes,
    required this.typography,
  });
}

class AppColors {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color black;
  final Color white;
  final Color grey;
  final Color greyDark;

  AppColors({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.black,
    required this.white,
    required this.grey,
    required this.greyDark,
  });
}

class ThemeColors {
  final Brightness brightness;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color mainContainer;
  final Color onMainContainer;
  final Color background;
  final Color onBackground;
  final Color avatarBackground;
  final Color titleText;
  final Color headlineText;
  final Color body1Text;
  final Color body2Text;
  final Color body3Text;
  final Color body4Text;
  final Color appBarTitle;
  final Color appBarSubtitle;
  final Color action;
  final Color border;
  final Color inputText;
  final Color inputHint;
  final Color textButton;
  final Color inputBackground;
  final Color shimmerEffect;
  final Color disabled;

  ThemeColors({
    required this.brightness,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.mainContainer,
    required this.onMainContainer,
    required this.background,
    required this.onBackground,
    required this.avatarBackground,
    required this.titleText,
    required this.headlineText,
    required this.body1Text,
    required this.body2Text,
    required this.body3Text,
    required this.body4Text,
    required this.appBarTitle,
    required this.appBarSubtitle,
    required this.action,
    required this.border,
    required this.inputText,
    required this.inputHint,
    required this.textButton,
    required this.inputBackground,
    required this.shimmerEffect,
    required this.disabled,
  });
}

class ThemeTypography {
  final String fontFamily;

  ThemeTypography({
    required this.fontFamily,
  });
}

class ThemeSizes {
  final double borderRadius;
  final double elevation;
  final double iconSize;
  final double extraSmall;
  final double small;
  final double smallMedium;
  final double medium;
  final double mediumLarge;
  final double large;
  final double headlineFontSize;
  final double titleFontSize;
  final double extraLargeFontSize;
  final double largeFontSize;
  final double mediumFontSize;
  final double smallFontSize;
  final double extraSmallFontSize;
  final double buttonHeight;
  final double inputHeight;
  final double minFontScaleFactor;
  final double maxFontScaleFactor;
  final double baseScreenWidth;
  final double baseScreenHeight;

  ThemeSizes({
    required this.borderRadius,
    required this.elevation,
    required this.iconSize,
    required this.extraSmall,
    required this.small,
    required this.smallMedium,
    required this.medium,
    required this.mediumLarge,
    required this.large,
    required this.headlineFontSize,
    required this.titleFontSize,
    required this.extraLargeFontSize,
    required this.largeFontSize,
    required this.mediumFontSize,
    required this.smallFontSize,
    required this.extraSmallFontSize,
    required this.buttonHeight,
    required this.inputHeight,
    required this.minFontScaleFactor,
    required this.maxFontScaleFactor,
    required this.baseScreenWidth,
    required this.baseScreenHeight,
  });
}
