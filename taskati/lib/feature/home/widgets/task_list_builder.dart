import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/widgets/task_item_widget.dart';

class TaskListBuilder extends StatefulWidget {
  const TaskListBuilder({
    super.key,
  });

  @override
  State<TaskListBuilder> createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          height: 100,
          width: 80,
          DateTime.now().subtract(const Duration(days: 2)),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primaryColor,
          selectedTextColor: Colors.white,
          dayTextStyle: getBodyTextStyle(context, fontSize: 12),
          monthTextStyle: getBodyTextStyle(context, fontSize: 12),
          dateTextStyle: getBodyTextStyle(context, fontSize: 20),
          onDateChange: (date) {
            setState(() {
              selectedDate = DateFormat.yMd().format(date);
            });
          },
        ),
        const Gap(20),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: AppLocalStorage.taskBox.listenable(),
            builder: (context, box, child) {
              List<TaskModel?> taskList = [];
              box.keys.forEach((key) {
                if (AppLocalStorage.getCachedTask(key)?.date == selectedDate) {
                  taskList.add(AppLocalStorage.getCachedTask(key));
                }
              });
              return taskList.isEmpty
                  ? Column(
                      children: [
                        Lottie.asset('assets/images/no_tasks.json'),
                        const Gap(20),
                        Text(
                          'No tasks added yet',
                          style: getBodyTextStyle(context),
                        )
                      ],
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskList.length,
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              box.delete(taskList[index]?.id);
                            } else {
                              box.put(
                                  taskList[index]?.id,
                                  TaskModel(
                                      id: taskList[index]?.id ?? '',
                                      title: taskList[index]?.title ?? '',
                                      note: taskList[index]?.note ?? '',
                                      date: taskList[index]?.date ?? '',
                                      startTime:
                                          taskList[index]?.startTime ?? '',
                                      endTime: taskList[index]?.endTime ?? '',
                                      color: 3,
                                      isCompleted: true));
                            }
                          },
                          secondaryBackground: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: AppColors.whiteColor,
                                ),
                                const Gap(5),
                                Text(
                                  'Delete Task',
                                  style: getBodyTextStyle(context,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          background: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                ),
                                const Gap(5),
                                Text(
                                  'Complete Task',
                                  style: getBodyTextStyle(context,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          child: TaskItemWidget(
                            model: taskList[index],
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
