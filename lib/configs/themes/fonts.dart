import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme kTextTheme(TextTheme theme) {
  return GoogleFonts.poppinsTextTheme(theme);
}

TextTheme kHeadlineTheme(TextTheme theme, [String language = 'fr']) {
  return GoogleFonts.poppinsTextTheme(theme);
}