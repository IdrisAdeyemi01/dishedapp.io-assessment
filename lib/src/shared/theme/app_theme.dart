import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    iconTheme: _iconTheme,
    scaffoldBackgroundColor: AppColors.white,
    toggleableActiveColor: AppColors.grey,
  );

  static const ColorScheme _colorScheme = ColorScheme(
    primary: AppColors.black,
    primaryVariant: AppColors.grey,
    background: AppColors.white,
    brightness: Brightness.light,
    secondary: AppColors.orange,
    secondaryVariant: AppColors.lightOrange,
    surface: AppColors.white,
    onBackground: AppColors.black,
    onError: AppColors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
    error: AppColors.errorColor,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: AppColors.black,
      fontSize: 34,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headline4: TextStyle(
      color: AppColors.textLightGrey,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13,
      color: AppColors.black,
    ),
    button: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );
  static const IconThemeData _iconTheme =
      IconThemeData(color: AppColors.iconGrey);
}
