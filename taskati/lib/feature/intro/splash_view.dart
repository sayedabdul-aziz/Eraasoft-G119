import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(
          context,
          (AppLocalStorage.getCachedData(AppLocalStorage.kIsUploaded) ?? false)
              ? const HomeView()
              : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json', width: 250, height: 250),
            Text(
              'Taskati',
              style: getTitleTextStyle(context,
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Gap(10),
            Text(
              'It\'s time to be organized!',
              style: getSmallTextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
