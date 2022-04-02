import 'dart:io' show Platform;

class AppConfig {
  bool isAndroid = true;
  bool isIos = false;

  final String appName = 'Delts Project';

  getPlatform() {
    if (Platform.isAndroid) {
      isAndroid = true;
      isIos = false;
    } else if (Platform.isIOS) {
      isAndroid = false;
      isIos = true;
    } else {}
  }
}
