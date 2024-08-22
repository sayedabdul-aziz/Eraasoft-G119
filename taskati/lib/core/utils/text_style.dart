import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getHeadlineTextStyle(
    {double fontSize = 24,
    fontWeight = FontWeight.bold,
    color = AppColors.blackColor}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// title

TextStyle getTitleTextStyle(
    {double fontSize = 18,
    fontWeight = FontWeight.w600,
    color = AppColors.blackColor}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getBodyTextStyle(
    {double fontSize = 16,
    fontWeight = FontWeight.normal,
    color = AppColors.blackColor}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
// small

TextStyle getSmallTextStyle(
    {double fontSize = 12,
    fontWeight = FontWeight.normal,
    color = AppColors.greyColor}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
