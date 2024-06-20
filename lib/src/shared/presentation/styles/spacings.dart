import 'package:app/src/shared/presentation/styles/theme_default.dart';
import 'package:app/src/utils/device_dimensions_utils.dart';

class AppSizes {
  static final double borderRadius = HeightSpacing.custom(themeSizes.borderRadius);
}

class HeightSpacing {
  static final double extraSmall = _calculateSpacing(themeSizes.extraSmall);
  static final double small = _calculateSpacing(themeSizes.small);
  static final double smallMedium = _calculateSpacing(themeSizes.smallMedium);
  static final double medium = _calculateSpacing(themeSizes.medium);
  static final double mediumLarge = _calculateSpacing(themeSizes.mediumLarge);
  static final double heightBtn = 20 + _calculateSpacing(themeSizes.buttonHeight - 20);
  static final double large = _calculateSpacing(themeSizes.large);
  static double custom(double height) => _calculateSpacing(height);
  static double customWithFixed(double height) => _calculateSpacing(height / 2) + (height / 2);

  static double baseHeightResolution = 902.0;
  static double baseScreenDensity = 3;

  static double _calculateSpacing(double baseSize) {
    double heightRatio = DeviceDimensions.screenHeight / baseHeightResolution;
    double adjustedSpacing = baseSize * heightRatio;

    return adjustedSpacing;
  }
}

class WidthSpacing {
  static final double extraSmall = _calculateSpacing(themeSizes.extraSmall);
  static final double small = _calculateSpacing(themeSizes.small);
  static final double smallMedium = _calculateSpacing(themeSizes.smallMedium);
  static final double medium = _calculateSpacing(themeSizes.medium);
  static final double mediumLarge = _calculateSpacing(themeSizes.mediumLarge);
  static final double large = _calculateSpacing(themeSizes.large);
  static double custom(double width) => _calculateSpacing(width);
  static double customWithFixed(double width) => _calculateSpacing(width / 2) + (width / 2);

  static double baseWidthResolution = 428.0;
  static double baseScreenDensity = 3;

  static double _calculateSpacing(double baseSize) {
    double widthRatio = DeviceDimensions.screenWidth / baseWidthResolution;
    double adjustedSpacing = baseSize * widthRatio;

    return adjustedSpacing;
  }
}
