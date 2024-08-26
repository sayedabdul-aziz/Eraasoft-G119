import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? path;
  String name = '';
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    path = AppLocalStorage.getCachedData(AppLocalStorage.kUserImage);
    name = AppLocalStorage.getCachedData(AppLocalStorage.kUsername) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode =
        AppLocalStorage.getCachedData(AppLocalStorage.kIsDarkMode) ?? false;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              pushAndRemoveUntil(context, const HomeView());
            },
          ),
          actions: [
            // change dark mode
            IconButton(
              onPressed: () {
                AppLocalStorage.cacheData(
                    AppLocalStorage.kIsDarkMode, !isDarkMode);
                setState(() {});
              },
              icon: const Icon(Icons.dark_mode, color: AppColors.primaryColor),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: (path != null)
                            ? FileImage(File(path ?? ''))
                            : const AssetImage('assets/user.png'),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppColors.whiteColor,
                                  builder: (context) {
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.whiteColor,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Gap(20),
                                          CustomButton(
                                              width: double.infinity,
                                              onTap: () {
                                                pickImage(true);
                                                Navigator.pop(context);
                                              },
                                              text: 'Upload From Camera'),
                                          const Gap(15),
                                          CustomButton(
                                              width: double.infinity,
                                              onTap: () {
                                                pickImage(false);
                                                Navigator.pop(context);
                                              },
                                              text: 'Upload From Gallery'),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor),
                                child: const Icon(Icons.camera_alt_rounded)),
                          )),
                    ],
                  ),
                  const Gap(40),
                  const Divider(
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Row(children: [
                    Text(
                      name,
                      style: getTitleTextStyle(context,
                          color: AppColors.primaryColor),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: () {},
                      color: AppColors.primaryColor,
                      icon: const Icon(Icons.edit),
                    )
                  ])
                ],
              ),
            ),
          ),
        ));
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
        AppLocalStorage.cacheData(AppLocalStorage.kUserImage, path);
      }
    });
  }
}
