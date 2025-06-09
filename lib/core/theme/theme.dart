import 'package:flutter/material.dart';
import 'package:musicapp/core/theme/color_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border([Color color = ColorPallete.borderColor]) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: color),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(width: 3, color: ColorPallete.borderColor),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      focusedBorder: _border(ColorPallete.gradinet2),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: ColorPallete.gradinet2, width: 3),
      //   borderRadius: BorderRadius.circular(10),
      // ),
    ),
    // textTheme: TextTheme(
    //   titleMedium: TextStyle()
    // )
  );
}
