import 'package:flutter/material.dart';

abstract class AppColors {
  static Color white = const Color(0xffFCFCFC);
  static Color lightColor = const Color(0xffECECEC);
  static Color lowPriority = const Color(0xffFFC107);

  // Elite Sapphire & Cyan Palette (Modern High-End Ambience)
  static Color primaryColor = const Color(0xff3B82F6); // Modern Azure Blue
  static Color secondaryColor = const Color(0xff1D4ED8); // Deep Royal Blue
  static Color accentColor = const Color(0xff22D3EE); // Bright Cyan

  static Color darkColor = const Color(0xff0F172A); // Slate Surface
  static Color scaffoldColor = const Color(0xff020617); // Midnight Black
  static Color appBarColor = const Color(0xff020617).withOpacity(0.8);

  static const Color warmYellow = Color(0xFFF0DA69);
  static const Color softMint = Color(0xFFA3DAC2);
  static const Color blushPink = Color(0xFFE7C2D4);
  static const Color skyBlue = Color(0xFF92BDF6);
}
