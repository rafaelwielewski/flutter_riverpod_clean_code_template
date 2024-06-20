import 'package:app/src/shared/presentation/provider/theme_provider.dart';
import 'package:app/src/shared/presentation/styles/spacings.dart';
import 'package:flutter/material.dart';

class AppBorders {
  static inputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      borderSide: BorderSide(color: ThemeProvider.of(context).themeColors.border, width: 1),
    );
  }

  static focusedInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      borderSide: BorderSide(color: ThemeProvider.of(context).themeColors.border),
    );
  }

  static inputBorderError(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      borderSide: BorderSide(color: ThemeProvider.of(context).appColors.error, width: 2),
    );
  }

  static focusedInputBorderError(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      borderSide: BorderSide(color: ThemeProvider.of(context).appColors.error),
    );
  }

  static bottomBorder(BuildContext context) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ThemeProvider.of(context).themeColors.border,
          width: 1,
        ),
      ),
    );
  }

  static BoxDecoration radiusBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: ThemeProvider.of(context).themeColors.inputBackground,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      border: Border.all(
        color: ThemeProvider.of(context).themeColors.border,
        width: 1.0,
      ),
    );
  }

  static BoxDecoration radiusBoxDecorationError(BuildContext context) {
    return BoxDecoration(
      color: ThemeProvider.of(context).themeColors.inputBackground,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
      border: Border.all(
        color: ThemeProvider.of(context).appColors.error,
        width: 2.0,
      ),
    );
  }
}
