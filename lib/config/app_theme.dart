import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/app_colors.dart';

class AppTheme {
  static var appTheme = ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
      ),
      primaryColor: AppColors.primaryColor,
      primarySwatch: AppColors.primaryColor as MaterialColor,
      fontFamily: GoogleFonts.comfortaa().fontFamily,
      scaffoldBackgroundColor: AppColors.nearlyWhite,
      buttonTheme: const ButtonThemeData(buttonColor: AppColors.primaryColor),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: AppColors.black,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.comfortaa().fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            // letterSpacing: 0.5,
            color: AppColors.darkText,
          )));
}
