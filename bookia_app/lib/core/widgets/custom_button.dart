import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 50,
    required this.text,
    required this.onTap,
    this.isBorder = false,
    this.textStyle,
    this.color = AppColors.primaryColor,
    this.radius = 8,
  });
  final double width;
  final double height;
  final String text;
  final Function() onTap;
  final TextStyle? textStyle;
  final Color color;
  final double radius;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: isBorder
                    ? const BorderSide(color: AppColors.textColor)
                    : BorderSide.none),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: textStyle ??
                getBodyTextStyle(context, color: AppColors.whiteColor),
          )),
    );
  }
}
