import 'package:app/src/shared/domain/models/device.dart';
import 'package:app/src/shared/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle buildSystemUiOverlayStyle(BuildContext context) {
  final brightness = ThemeProvider.of(context).themeColors.brightness == Brightness.light ? Brightness.dark : Brightness.light;
  final backgroundColor = ThemeProvider.of(context).themeColors.background;

  if (Device.androidRelease > 9) {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarIconBrightness: brightness,
      statusBarIconBrightness: brightness,
      statusBarColor: Colors.transparent,
    );
  } else {
    return SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: brightness,
      systemNavigationBarColor: backgroundColor,
      statusBarIconBrightness: brightness,
    );
  }
}

SystemUiOverlayStyle buildSystemUiOverlayStyleWithColor(
    {required Brightness navBrightness, required Brightness statusBrightness, required Color backgroundColor}) {
  if (Device.androidRelease > 9) {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarIconBrightness: navBrightness,
      statusBarIconBrightness: statusBrightness,
      statusBarColor: Colors.transparent,
    );
  } else {
    return SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: navBrightness,
      systemNavigationBarColor: backgroundColor,
      statusBarIconBrightness: statusBrightness,
    );
  }
}
