import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/back_btn_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            BackButtonWidget(),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          } else if (state is RegisterLoadingState) {
            showLoadingDialog(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Hello! Register to get started',
                          style: getHeadlineTextStyle(context),
                        ),
                        const Gap(32),
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const Gap(15),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const Gap(15),
                        TextFormField(
                          controller: confirmPasswordController,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            return null;
                          },
                        ),
                        const Gap(30),
                        CustomButton(
                            text: 'Register',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(RegisterEvent(
                                    RegisterModelParams(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        passwordConfirmation:
                                            confirmPasswordController.text)));
                              }
                            }),
                      ],
                    ),
                  ),
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
                            pushReplacement(context, const LoginView());
                          },
                          child: Text(
                            'Register Now',
                            style: getSmallTextStyle(context,
                                color: AppColors.primaryColor),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
