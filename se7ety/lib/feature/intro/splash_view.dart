import 'package:flutter/material.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_view.dart';
import 'package:se7ety/feature/intro/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // todo: 1)
      // Todo: check this user is a doctor or patient
      // todo: using firebase firestore
      // todo: using cacheing
      bool isOnboardingShown =
          AppLocalStorage.getCachedData(key: AppLocalStorage.onboarding) ??
              false;
      if (isOnboardingShown) {
        pushReplacement(context, const WelcomeView());
      } else {
        pushReplacement(context, const OnboardingView());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
