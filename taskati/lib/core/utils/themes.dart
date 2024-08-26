import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.blackColor),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallTextStyle(),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          )));

  static ThemeData darkTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.darkScaffoldBg,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.darkScaffoldBg,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallTextStyle(),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          )));
}
