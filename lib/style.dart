import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFF1CE),
    textTheme: defaultTextstyle(),
  );
}

TextTheme defaultTextstyle() {
  return TextTheme(
    headline1: GoogleFonts.roboto(color: Color(0xFF000000), fontSize: 24,
      textStyle: TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1)),
    headline2: GoogleFonts.roboto(color: Color(0xFF000000), fontSize: 24, fontWeight: FontWeight.bold),
    headline3: GoogleFonts.roboto(color: Color(0xFF000000), fontSize: 18),
    headline4: GoogleFonts.roboto(color: Color(0xFF000000), fontSize: 14),
    headline5: GoogleFonts.roboto(color: Color(0xFF000000), fontSize: 8),
    subtitle1: GoogleFonts.roboto(color: Color(0xFFFFFFFF), fontSize: 18),
    subtitle2: GoogleFonts.roboto(color: Color(0xFFFFFFFF), fontSize: 24)
  );
}

const defaultBtnColor = Color(0x96FC3196);