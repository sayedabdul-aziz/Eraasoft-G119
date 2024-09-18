import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
      String token =
          AppLocalStorage.getCachedData(key: AppLocalStorage.token) ?? '';
      if (token.isEmpty) {
        pushReplacement(context, const WelcomeView());
      } else {
        pushReplacement(context, const NavBarWidget());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            const Gap(15),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(context, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
