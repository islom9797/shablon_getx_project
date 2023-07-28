import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonStyle extends ButtonStyle {
  static ButtonStyle medium({Color? backgroundColor, bool rounded = true}) {
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: const StadiumBorder(),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.comfortaa().fontFamily,
        fontSize: 18,
      ),
    );
    return style;
  }

  static ButtonStyle small({Color? backgroundColor, bool rounded = true}) {
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      shape: rounded
          ? const StadiumBorder()
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.comfortaa().fontFamily,
        fontSize: 16,
      ),
    );
    return style;
  }
}
