import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMySplashScreen {
  static const MethodChannel _channel =
      const MethodChannel('flutter_my_splash_screen');

  ///hide splash screen
  static Future<Null> hide() async {
    await _channel.invokeMethod('hide');
  }

  ///hide splash screen
  static Future<Null> show() async {
    await _channel.invokeMethod('show');
  }
}
