import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.padding,
    this.size,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: Container(
        padding: padding ?? EdgeInsets.all(WidthSpacing.customWithFixed(24)),
        child: Icon(
          icon,
          color: color ?? ThemeProvider.of(context).appColors.white,
          size: size ?? 24,
        ),
      ),
    );
  }
}
