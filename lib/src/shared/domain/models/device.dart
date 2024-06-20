class Device {
  static int get androidRelease => 10;
  static String os = '';
  static String deviceVersion = '';
  static String deviceId = '';
  static bool isBioSupported = false;

  static Map<String, dynamic> toJson() => {
        'os': os,
        'deviceId': deviceId,
      };
}
