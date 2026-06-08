import 'package:flutter/cupertino.dart';

class PreCacheManager {
  static const List<String> images = ['assets/images/google.png'];

  static void _loadImage({
    required BuildContext context,
    required ImageProvider<Object> provider,
  }) {
    images.map((i) => precacheImage(provider, context));
  }
}
