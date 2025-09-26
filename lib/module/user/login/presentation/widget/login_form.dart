import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/widget/button.dart';
import 'package:vietlite/widget/input/input.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/module/user/login/application/login_bloc.dart';

part 'package:vietlite/module/user/login/presentation/widget/skip_login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.s20),
      child: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: '${context.lang.signIn} ',
                    style: context.defaultStyle.s16.bold.copyWith(
                      color: context.color.neutral,
                    ),
                    children: [
                      TextSpan(
                        text: context.lang.free,
                        style: context.defaultStyle.s16.bold.copyWith(
                          color: context.color.nameColor.shade100,
                        ),
                      ),
                      TextSpan(
                        text: ' ${context.lang.toDiscover}',
                        style: context.defaultStyle.s16.bold.copyWith(
                          color: context.color.neutral,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.s20),
                Input.email(
                  fieldKey: WidgetKeys.emailInput,
                  hintText: context.lang.inputEmail,
                  controller: nameController,
                ),
                SizedBox(height: AppDimensions.s8),
                Input.password(
                  fieldKey: WidgetKeys.passwordInput,
                  hintText: context.lang.inputPassword,
                  controller: passwordController,
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(
                        LoginEvent.signInWithEmailAndPassword(
                          email: EmailAddress(nameController.text),
                          password: Password(passwordController.text),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: AppDimensions.s8),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            AppLocator.router.push(const RegisterScreenRoute());
                          },
                          child: Text(
                            context.lang.signUp,
                            style: context.defaultStyle.semiBold.copyWith(
                              color: context.color.neutral,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            AppLocator.router.push(
                              const ForgetPasswordScreenRoute(),
                            );
                          },
                          child: Text(
                            context.lang.forgetPassword,
                            style: context.defaultStyle.semiBold.copyWith(
                              color: context.color.neutral,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppDimensions.s8),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isSignInWithEmailAndPassword !=
                          current.isSignInWithEmailAndPassword,
                  builder: (context, state) {
                    return (!state.isSignInWithEmailAndPassword)
                        ? Button.primary(
                          key: WidgetKeys.signInWithPasswordButton,
                          buttonName: context.lang.signIn,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                LoginEvent.signInWithEmailAndPassword(
                                  email: EmailAddress(nameController.text),
                                  password: Password(passwordController.text),
                                ),
                              );
                            }
                          },
                        )
                        : Center(
                          child: Loading.small(
                            key: WidgetKeys.signInWithPasswordLoading,
                          ),
                        );
                  },
                ),
                SizedBox(height: AppDimensions.s12),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: context.color.neutral.shade400,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.s8,
                      ),
                      child: Text(
                        context.lang.orSignInWith,
                        style: context.defaultStyle.s12.copyWith(
                          color: context.color.neutral.shade400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: context.color.neutral.shade400,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.s12),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isSignInWithGoogle !=
                          current.isSignInWithGoogle,
                  builder: (context, state) {
                    return (!state.isSignInWithGoogle)
                        ? InkWell(
                          key: WidgetKeys.signInWithGoogleButton,
                          onTap: () {
                            context.read<LoginBloc>().add(
                              const LoginEvent.signInWithGoogle(),
                            );
                          },
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.google,
                              height: AppDimensions.s32,
                              width: AppDimensions.s32,
                            ),
                          ),
                        )
                        : Center(
                          child: Loading.small(
                            key: WidgetKeys.signInWithPasswordLoading,
                          ),
                        );
                  },
                ),
                SizedBox(height: AppDimensions.s12),
                const Center(child: _SkipLoginButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
