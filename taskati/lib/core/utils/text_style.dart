import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getHeadlineTextStyle(context,
    {double fontSize = 24, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

// title

TextStyle getTitleTextStyle(context,
    {double fontSize = 18, fontWeight = FontWeight.w600, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(context,
    {double fontSize = 16, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
// small

TextStyle getSmallTextStyle(
    {double fontSize = 12,
    fontWeight = FontWeight.normal,
    color = AppColors.greyColor}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
