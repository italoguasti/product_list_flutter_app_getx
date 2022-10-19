import 'package:flutter/material.dart';
import 'package:getx_lesson_one/theme/app_colors.dart';

ThemeData makeAppTheme() {
  const TextTheme textTheme = TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
  );

  return ThemeData(
    backgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.primary,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: textTheme,
  );
}
