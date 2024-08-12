import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({super.key, required this.result});
  final double result;

// ≤ 18.4	Underweight
// 18.5 - 24.9	Normal
// 25.0 - 39.9	Overweight
// ≥ 40.0	Obese
  late Color? statusColor = Colors.white;

  String getStatus() {
    if (result <= 18.4) {
      statusColor = Colors.yellow;
      return "Underweight";
    } else if (result <= 24.9) {
      statusColor = Colors.green;
      return "Normal";
    } else {
      statusColor = Colors.red;
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getStatus(),
              style: TextStyle(color: statusColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result.toStringAsFixed(2),
              style: TextStyle(fontSize: 30, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
