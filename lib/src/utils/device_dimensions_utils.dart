import 'package:flutter/material.dart';

class DeviceDimensions {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double screenDensity = 0.0;

  static void init(BuildContext context) {
    if (screenWidth != 0.0) return;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    screenDensity = MediaQuery.of(context).devicePixelRatio;
  }
}
