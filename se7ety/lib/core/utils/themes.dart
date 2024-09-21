import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            snackBarTheme:
                SnackBarThemeData(backgroundColor: AppColors.redColor),
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: WidgetStatePropertyAll(AppColors.color1),
                // trackColor: MaterialStatePropertyAll(AppColors.color2),
                // trackVisibility: const MaterialStatePropertyAll(true),
                radius: const Radius.circular(20)),
            appBarTheme: AppBarTheme(
                titleTextStyle: getTitleStyle(color: AppColors.white),
                centerTitle: true,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(color: AppColors.color1),
                backgroundColor: AppColors.color1),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.only(
                  left: 20, top: 10, bottom: 10, right: 20),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              suffixIconColor: AppColors.color1,
              prefixIconColor: AppColors.color1,
              fillColor: AppColors.scaffoldBG,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            dividerTheme: DividerThemeData(
              color: AppColors.black,
              indent: 10,
              endIndent: 10,
            ),
            fontFamily: GoogleFonts.cairo().fontFamily);
}
