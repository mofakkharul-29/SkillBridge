import 'package:flutter/cupertino.dart';

class PreCacheManager {
  static const List<String> images = ['assets/images/google.png'];

  static Future<void> preloadImages(BuildContext context) async {
    await Future.wait(
      images.map((path) => precacheImage(AssetImage(path), context)),
    );
  }
}
