//svg icon button passing svg path call back color and padding usingo iconbutton
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.path,
    this.icon,
    this.color,
    this.size,
  });

  final String? path;
  final IconData? icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final isSvg = path != null && path!.contains('.svg');
    final isImage = path != null && path!.contains('.png');
    final isIcon = icon != null;
    return isSvg
        ? SvgPicture.asset(
            path!,
            colorFilter: ColorFilter.mode(color ?? ThemeProvider.of(context).themeColors.onBackground, BlendMode.srcIn),
            width: HeightSpacing.custom((size ?? 9) / 2) + (size ?? 9) / 2,
            height: HeightSpacing.custom((size ?? 9) / 2) + (size ?? 9) / 2,
          )
        : isImage
            ? Image.asset(
                path!,
                color: color,
                width: HeightSpacing.custom((size ?? 9) / 2) + (size ?? 9) / 2,
                height: HeightSpacing.custom((size ?? 9) / 2) + (size ?? 9) / 2,
              )
            : isIcon
                ? Icon(
                    icon!,
                    color: color,
                    size: HeightSpacing.custom((size ?? 9) / 2) + (size ?? 9) / 2,
                  )
                : const SizedBox();
  }
}
