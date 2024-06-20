import 'package:app/src/shared/domain/enums/color_type.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final ColorType color;
  final bool border;
  final Color? borderColor;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool Function() isValid;

  const CustomButton({
    super.key,
    required this.text,
    this.color = ColorType.primary,
    this.border = false,
    this.borderColor,
    this.isLoading = false,
    this.onPressed,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    Color themeColor;
    Color onThemeColor;
    switch (color) {
      case ColorType.primary:
        themeColor = ThemeProvider.of(context).themeColors.primaryContainer;
        onThemeColor = ThemeProvider.of(context).themeColors.onPrimaryContainer;
        break;
      case ColorType.secondary:
        themeColor = ThemeProvider.of(context).themeColors.secondaryContainer;
        onThemeColor = ThemeProvider.of(context).themeColors.onSecondaryContainer;
        break;
      case ColorType.tertiary:
        themeColor = ThemeProvider.of(context).themeColors.tertiaryContainer;
        onThemeColor = ThemeProvider.of(context).themeColors.onTertiaryContainer;
        break;
      case ColorType.background:
        themeColor = ThemeProvider.of(context).themeColors.background;
        onThemeColor = ThemeProvider.of(context).themeColors.onBackground;
        break;
      case ColorType.transparent:
        themeColor = Colors.transparent;
        onThemeColor = ThemeProvider.of(context).appColors.primary;
        break;
    }

    return Focus(
      onFocusChange: (hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        padding: EdgeInsets.only(top: HeightSpacing.small, bottom: HeightSpacing.small),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: HeightSpacing.heightBtn,
          child: ElevatedButton(
            key: Key(text),
            onPressed: onPressed != null
                ? () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (isLoading) return;
                    if (isValid()) {
                      onPressed?.call();
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              foregroundColor: onThemeColor.withOpacity(0.5),
              shadowColor: Colors.transparent,
              backgroundColor: themeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              ),
              side: border ? BorderSide(color: borderColor ?? onThemeColor, width: 1.0) : null,
            ),
            child: isLoading
                ? SizedBox(
                    height: HeightSpacing.heightBtn / 2,
                    width: HeightSpacing.heightBtn / 2,
                    child: CircularProgressIndicator(
                      color: onThemeColor,
                    ),
                  )
                : Text(
                    text,
                    style: AppTypography.button(context).copyWith(color: onThemeColor),
                  ),
          ),
        ),
      ),
    );
  }
}
