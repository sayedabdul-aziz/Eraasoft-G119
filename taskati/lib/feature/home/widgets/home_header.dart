import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/profile/profile_view.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
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
                'Hello, ${AppLocalStorage.getCachedData(AppLocalStorage.kUsername).split(' ')[0]}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    getTitleTextStyle(context, color: AppColors.primaryColor),
              ),
              const Gap(5),
              Text(
                'Have a nice day',
                style: getBodyTextStyle(
                  context,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            push(context, const ProfileView());
          },
          child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 32,
              child: CircleAvatar(
                radius: 30,
                backgroundImage:
                    AppLocalStorage.getCachedData(AppLocalStorage.kUserImage) !=
                            null
                        ? FileImage(File(AppLocalStorage.getCachedData(
                            AppLocalStorage.kUserImage)))
                        : const AssetImage('assets/images/user.png'),
              )),
        )
      ],
    );
  }
}
