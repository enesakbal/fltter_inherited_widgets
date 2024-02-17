import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.green,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    scheme: FlexScheme.bigStone,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(bottomAppBarSchemeColor: SchemeColor.primary),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
  );
}
