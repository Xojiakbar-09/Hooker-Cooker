import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/fonts.gen.dart';

class Apptheme {
  static final ThemeData light = ThemeData(
    fontFamily: FontFamily.plus,
    scaffoldBackgroundColor: Cols.white,
    colorScheme: ColorScheme.light(primary: Cols.primery),
  );

  static final ThemeData dark = ThemeData(
    fontFamily: FontFamily.plus,
    scaffoldBackgroundColor: Cols.dark,
    colorScheme: ColorScheme.dark(primary: Cols.primery),
  );
}
