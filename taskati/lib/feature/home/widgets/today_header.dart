import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/add_task_view.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: getTitleTextStyle(
                  context,
                ),
              ),
              const Gap(5),
              Text(
                'Today',
                style: getTitleTextStyle(
                  context,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
            width: 130,
            height: 45,
            text: 'Add Task',
            onTap: () {
              push(context, const AddTaskView());
            })
      ],
    );
  }
}
