import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? imagePath;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  var box = Hive.box('userBox');
                  box.put('image', imagePath);
                  box.put('name', name);
                  box.put('isUploaded', true);
                  pushReplacement(context, const HomeView());
                } else if (imagePath != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('Name cannot be empty'),
                  ));
                } else if (imagePath == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('Image cannot be empty'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: AppColors.redColor,
                    content: Text('Image and Name cannot be empty'),
                  ));
                }
              },
              child: Text(
                'Done',
                style: getBodyTextStyle(color: AppColors.primaryColor),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: (imagePath != null)
                      ? FileImage(File(imagePath ?? ''))
                      : const AssetImage('assets/images/user.png'),
                ),
                const Gap(20),
                CustomButton(
                  text: 'Upload From Camera',
                  onTap: () {
                    pickImage(isFromCamera: true);
                  },
                ),
                const Gap(10),
                CustomButton(
                  text: 'Upload From Gallery',
                  onTap: () {
                    pickImage(isFromCamera: false);
                  },
                ),
                const Gap(15),
                const Divider(),
                const Gap(15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Write Your Name Here ..',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage({required bool isFromCamera}) {
    ImagePicker()
        .pickImage(
            source: isFromCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          imagePath = value.path;
        });
      }
    });
  }
}
