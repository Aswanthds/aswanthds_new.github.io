import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle s52 = GoogleFonts.mochiyPopPOne(
    color: AppColors.white,
    fontSize: 52,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s32 = GoogleFonts.mochiyPopPOne(
    color: AppColors.primaryColor,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s28 = GoogleFonts.mochiyPopPOne(
    color: AppColors.primaryColor,
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s24 = GoogleFonts.mochiyPopPOne(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s18 = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s17 = TextStyle(
    color: AppColors.white,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static TextStyle s16 = GoogleFonts.outfit(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s14 = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
