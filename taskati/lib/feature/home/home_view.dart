import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              const Gap(20),
              const TodayHeaderWidget(),
              const Gap(20),
              DatePicker(
                height: 100,
                width: 80,
                DateTime.now().subtract(const Duration(days: 2)),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
