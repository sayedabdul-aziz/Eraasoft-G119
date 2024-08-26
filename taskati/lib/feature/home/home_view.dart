import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/task_list_builder.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeaderWidget(),
              Gap(20),
              TodayHeaderWidget(),
              Gap(20),
              Expanded(child: TaskListBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}
