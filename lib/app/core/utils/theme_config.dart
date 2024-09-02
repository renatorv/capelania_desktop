import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'kcolors.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      color: Kolors.kRed,
      iconTheme: IconThemeData(color: Kolors.kWhite),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );
}
