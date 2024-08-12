import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onTap,
    this.radius = 10,
  });

  final String text;
  final Color bgColor;
  final Function() onTap;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              backgroundColor: bgColor),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
