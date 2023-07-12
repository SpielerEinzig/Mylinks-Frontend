import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedUtils {
  Size getSize(context) => MediaQuery.of(context).size;

  Future<void> launchWebUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
