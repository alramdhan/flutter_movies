import 'package:flutter/material.dart';
import 'package:flutter_movies/utils/themes/app_color.dart';

class AppTheme {
  static final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primary,
  );

  static const _textStyle = TextStyle(fontFamily: 'MPlus2');

  static final ThemeData themeLight = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme: colorScheme.copyWith(
      surface: AppColor.light,
      onSurface: AppColor.dark
    ),
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.light,
    textTheme: const TextTheme().copyWith(
      bodySmall: _textStyle,
      bodyMedium: _textStyle,
      bodyLarge: _textStyle,
      titleLarge: _textStyle,
      titleMedium: _textStyle,
      titleSmall: _textStyle,
      displayLarge: _textStyle,
      displayMedium: _textStyle,
      displaySmall: _textStyle,
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white
      ),
    ),
  );
  static final ThemeData themeDark = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    colorScheme: colorScheme.copyWith(
      surface: AppColor.dark,
      onSurface: AppColor.light
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.dark,
    textTheme: const TextTheme().copyWith(
      bodySmall: _textStyle,
      bodyMedium: _textStyle,
      bodyLarge: _textStyle,
      titleLarge: _textStyle,
      titleMedium: _textStyle,
      titleSmall: _textStyle,
      displayLarge: _textStyle,
      displayMedium: _textStyle,
      displaySmall: _textStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white
      ),
    ),
  );
}