import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color? color;
  const LoadingWidget({super.key, this.size = 160, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: WidthSpacing.customWithFixed(size + size * 0.4),
            height: HeightSpacing.customWithFixed(size + size * 0.4),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(color ?? ThemeProvider.of(context).themeColors.onBackground),
            ),
          ),
          ClipOval(
            child: Padding(
              padding: EdgeInsets.all(HeightSpacing.customWithFixed(size * 0.4)),
              child: CustomImage(path: 'assets/logo/logo.png', size: size, color: color ?? ThemeProvider.of(context).themeColors.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
