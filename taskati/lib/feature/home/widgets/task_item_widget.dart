import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/add_task/add_task_view.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.model,
  });
  final TaskModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (model?.isCompleted != true) {
          push(
              context,
              AddTaskView(
                model: model,
              ));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (model?.color == 0)
                ? AppColors.primaryColor
                : (model?.color == 1)
                    ? AppColors.orangeColor
                    : (model?.color == 2)
                        ? AppColors.redColor
                        : Colors.green),
        child: Row(children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                model?.title ?? '',
                style: getTitleTextStyle(context, color: AppColors.whiteColor),
              ),
              const Gap(5),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    color: AppColors.whiteColor,
                  ),
                  const Gap(10),
                  Text(
                    '${model?.startTime} - ${model?.endTime}',
                    style: getSmallTextStyle(color: AppColors.whiteColor),
                  )
                ],
              ),
              const Gap(5),
              Text(
                model?.note ?? '',
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
            ]),
          ),
          Container(
            width: .5,
            height: 60,
            color: AppColors.whiteColor,
          ),
          const Gap(10),
          // transform.rotate
          // angle: -90 * 3.14 / 180,
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (model?.isCompleted ?? false) ? 'COMPLETED' : 'TODO',
              style: getTitleTextStyle(context,
                  fontSize: 12, color: AppColors.whiteColor),
            ),
          ),
        ]),
      ),
    );
  }
}
