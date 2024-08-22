import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: getTitleTextStyle(),
            ),
            const Gap(5),
            Text(
              'Today',
              style: getTitleTextStyle(),
            ),
          ],
        ),
        const Spacer(),
        CustomButton(width: 130, height: 45, text: 'Add Task', onTap: () {})
      ],
    );
  }
}
