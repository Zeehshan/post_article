import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posts_article/configs/themes/colors.dart';
import 'package:posts_article/configs/themes/fonts.dart';
import 'package:posts_article/utils/utils.dart';


part 'dark_theme.dart';
part 'light_theme.dart';

class AppThemes {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;
}
