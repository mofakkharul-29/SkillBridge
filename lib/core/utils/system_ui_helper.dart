import 'package:flutter/services.dart';

class SystemUiHelper {
  static void hideStatusbar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
