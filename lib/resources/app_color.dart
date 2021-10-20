import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;

class AppColors {
  static const Color beigePink = Color(0xFFFFEFEF);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color violet500 = Color(0xFF53538A);
  static const Color grey100 = Color(0xFFF6F6F6);
  static const Color grey200alpha50 = Color(0x78ECECEC);
  static const Color transparent = Colors.transparent;

  static const violetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    stops: [.0, 253.0],
    colors: [Color(0xFF454581), Color(0xFF7777B0)],
  );
}
