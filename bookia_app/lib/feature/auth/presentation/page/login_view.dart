import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/back_btn_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/page/signup_view.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else {
            showLoadingDialog(context);
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Row(
                children: [
                  BackButtonWidget(),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Text(
                                  'Welcome back! Glad to see you, Again!',
                                  style: getHeadlineTextStyle(context),
                                ),
                                const Gap(32),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your email',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const Gap(15),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero),
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: getSmallTextStyle(context),
                                        ))
                                  ],
                                ),
                                const Gap(30),
                                CustomButton(
                                    text: 'Login',
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(LoginEvent(
                                            LoginModelParams(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text)));
                                      }
                                    }),
                                const Gap(34),
                                Row(
                                  children: [
                                    const Expanded(child: Divider()),
                                    const Gap(10),
                                    Text('Or Login with',
                                        style: getSmallTextStyle(context)),
                                    const Gap(10),
                                    const Expanded(child: Divider()),
                                  ],
                                ),
                                const Gap(20),
                                const SocialLoginWidget(),
                              ],
                            )),
                      )),
                ),
                Padding(
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
                          onPressed: () {
                            pushReplacement(context, const SignUpView());
                          },
                          child: Text(
                            'Register Now',
                            style: getSmallTextStyle(context,
                                color: AppColors.primaryColor),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
