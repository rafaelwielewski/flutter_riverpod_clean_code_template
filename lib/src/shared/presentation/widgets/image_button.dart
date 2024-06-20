import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.color,
    this.padding,
    this.size,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding ?? EdgeInsets.all(WidthSpacing.customWithFixed(24)),
        child: CustomImage(
          path: iconPath,
          size: size ?? 24,
          color: color ?? ThemeProvider.of(context).themeColors.onBackground,
        ),
      ),
    );
  }
}
