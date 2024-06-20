import 'package:app/src/shared/domain/models/themes.dart';
import 'package:flutter/material.dart';

CustomTheme get lightTheme => CustomTheme(
      appColors: appColors,
      themeColors: lightColors,
      sizes: themeSizes,
      typography: typography,
    );

CustomTheme get darkTheme => CustomTheme(
      appColors: appColors,
      themeColors: darkColors,
      sizes: themeSizes,
      typography: typography,
    );

ThemeTypography get typography => ThemeTypography(
      fontFamily: 'RedHatDisplay',
    );

ThemeSizes get themeSizes => ThemeSizes(
      borderRadius: 24.0,
      elevation: 2.0,
      iconSize: 24.0,
      extraSmall: 8.0,
      small: 12.0,
      smallMedium: 16.0,
      medium: 24.0,
      mediumLarge: 36.0,
      large: 56.0,
      headlineFontSize: 28.0,
      titleFontSize: 22.0,
      extraLargeFontSize: 20.0,
      largeFontSize: 18.0,
      mediumFontSize: 16.0,
      smallFontSize: 14.0,
      extraSmallFontSize: 12.0,
      buttonHeight: 48.0,
      inputHeight: 48.0,
      minFontScaleFactor: 0.8,
      maxFontScaleFactor: 1.2,
      baseScreenWidth: 375.0,
      baseScreenHeight: 812.0,
    );

AppColors get appColors => AppColors(
      primary: const Color.fromRGBO(91, 6, 161, 1),
      secondary: const Color.fromRGBO(44, 222, 170, 1),
      error: const Color.fromRGBO(243, 64, 64, 1),
      success: const Color.fromRGBO(92, 162, 81, 1),
      black: const Color.fromRGBO(10, 10, 10, 1),
      white: const Color.fromRGBO(248, 248, 248, 1),
      grey: const Color.fromRGBO(88, 88, 88, 1),
      greyDark: const Color.fromRGBO(38, 38, 30, 1),
    );

ThemeColors get darkColors => ThemeColors(
      brightness: Brightness.dark,
      primaryContainer: appColors.primary,
      onPrimaryContainer: appColors.white,
      secondaryContainer: appColors.white,
      onSecondaryContainer: appColors.primary,
      tertiaryContainer: appColors.black,
      onTertiaryContainer: appColors.white,
      mainContainer: const Color.fromRGBO(23, 23, 23, 1),
      onMainContainer: appColors.white,
      background: appColors.black,
      onBackground: appColors.white,
      avatarBackground: const Color.fromRGBO(210, 209, 209, 1),
      appBarTitle: appColors.white,
      appBarSubtitle: appColors.black,
      titleText: const Color.fromRGBO(248, 248, 248, 1),
      headlineText: const Color.fromRGBO(248, 248, 248, 1),
      body1Text: const Color.fromRGBO(248, 248, 248, 1),
      body2Text: const Color.fromRGBO(88, 88, 88, 1),
      body3Text: const Color.fromRGBO(116, 115, 115, 1),
      body4Text: const Color.fromRGBO(149, 148, 148, 1),
      action: const Color.fromRGBO(84, 147, 74, 1),
      border: const Color.fromARGB(255, 35, 35, 35),
      inputText: appColors.black,
      inputHint: const Color.fromRGBO(149, 148, 148, 1),
      inputBackground: appColors.white,
      shimmerEffect: const Color.fromRGBO(26, 26, 26, 1),
      textButton: Colors.blue,
      disabled: const Color.fromARGB(255, 156, 156, 156),
    );

ThemeColors get lightColors => ThemeColors(
      brightness: Brightness.light,
      primaryContainer: appColors.primary,
      onPrimaryContainer: appColors.white,
      secondaryContainer: appColors.white,
      onSecondaryContainer: appColors.primary,
      tertiaryContainer: appColors.black,
      onTertiaryContainer: appColors.white,
      mainContainer: const Color.fromRGBO(231, 231, 231, 1),
      onMainContainer: appColors.black,
      background: appColors.white,
      onBackground: appColors.black,
      avatarBackground: const Color.fromRGBO(210, 209, 209, 1),
      appBarTitle: appColors.primary,
      appBarSubtitle: appColors.black,
      titleText: const Color.fromARGB(255, 30, 30, 30),
      headlineText: const Color.fromARGB(255, 30, 30, 30),
      body1Text: const Color.fromARGB(255, 30, 30, 30),
      body2Text: const Color.fromARGB(168, 124, 124, 124),
      body3Text: const Color.fromARGB(255, 124, 124, 124),
      body4Text: const Color.fromRGBO(149, 148, 148, 1),
      action: const Color.fromRGBO(84, 147, 74, 1),
      border: const Color.fromARGB(255, 200, 200, 200),
      inputText: appColors.black,
      inputHint: const Color.fromRGBO(149, 148, 148, 1),
      inputBackground: appColors.white,
      shimmerEffect: const Color.fromRGBO(175, 175, 175, 1),
      textButton: Colors.blue,
      disabled: const Color.fromARGB(255, 200, 200, 200),
    );
