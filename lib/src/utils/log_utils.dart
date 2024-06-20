import 'dart:developer' as dev;

class LogUtils {
  static void log(dynamic message) {
    const bool isDevMode = true;
    if (isDevMode && message != null) dev.log(message.toString());
  }
}
