import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/back_btn_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            BackButtonWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: getSmallTextStyle(context),
            ),
            const Gap(4),
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {},
                child: Text(
                  'Register Now',
                  style:
                      getSmallTextStyle(context, color: AppColors.primaryColor),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Hello! Register to get started',
                style: getHeadlineTextStyle(context),
              ),
              const Gap(32),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 12,
                    maxWidth: 38,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: SvgPicture.asset(
                      'assets/icons/eye.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 12,
                    maxWidth: 38,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: SvgPicture.asset(
                      'assets/icons/eye.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const Gap(30),
              CustomButton(text: 'Login', onTap: () {}),
              const Gap(34),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  const Gap(10),
                  Text('Or Login with', style: getSmallTextStyle(context)),
                  const Gap(10),
                  const Expanded(child: Divider()),
                ],
              ),
              const Gap(20),
              const SocialLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
