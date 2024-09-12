import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/page/login_view.dart';
import 'package:bookia_app/feature/auth/presentation/page/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/welcom_bg.png',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                SvgPicture.asset('assets/images/logo.svg'),
                const Gap(20),
                Text(
                  'Order Your Book Now!',
                  style: getBodyTextStyle(context, fontSize: 20),
                ),
                const Spacer(flex: 4),
                CustomButton(
                    text: 'Login',
                    onTap: () {
                      push(context, const LoginView());
                    }),
                const Gap(15),
                CustomButton(
                  text: 'Register',
                  onTap: () {
                    push(context, const SignUpView());
                  },
                  color: AppColors.whiteColor,
                  isBorder: true,
                  textStyle: getBodyTextStyle(context),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
