import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/widget/button.dart';
import 'package:vietlite/widget/input/input_type.dart';
import 'package:vietlite/widget/input/label_input.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/module/user/register/application/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.s16),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  context.lang.signUpAccount,
                  style: context.defaultStyle.s16.bold,
                ),
                SizedBox(height: AppDimensions.s20),
                LabelInput(
                  key: WidgetKeys.emailInput,
                  label: context.lang.inputEmail,
                  controller: emailController,
                  inputType: InputType.email(),
                ),
                SizedBox(height: AppDimensions.s8),
                LabelInput(
                  key: WidgetKeys.nameInput,
                  label: context.lang.inputName,
                  controller: nameController,
                  inputType: InputType.text(),
                ),
                SizedBox(height: AppDimensions.s8),
                LabelInput(
                  key: WidgetKeys.passwordInput,
                  label: context.lang.inputPassword,
                  controller: passwordController,
                  inputType: InputType.password(),
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      context.read<RegisterBloc>().add(
                        RegisterEvent.registerWithEmailAndPassword(
                          email: EmailAddress(emailController.text),
                          password: Password(passwordController.text),
                          name: nameController.text,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: AppDimensions.s20),
                // TODO: make shimmer effect
                BlocBuilder<RegisterBloc, RegisterState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isRegister != current.isRegister,
                  builder: (context, state) {
                    return (!state.isRegister)
                        ? Button.primary(
                          key: WidgetKeys.registerButton,
                          buttonName: context.lang.signUp,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<RegisterBloc>().add(
                                RegisterEvent.registerWithEmailAndPassword(
                                  email: EmailAddress(emailController.text),
                                  password: Password(passwordController.text),
                                  name: nameController.text,
                                ),
                              );
                            }
                          },
                        )
                        : Center(
                          child: Loading.small(key: WidgetKeys.registerLoading),
                        );
                  },
                ),
                SizedBox(height: AppDimensions.s8),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      AppLocator.router.replaceAll([const LoginScreenRoute()]);
                    },
                    child: Text(
                      context.lang.backButton,
                      style: context.defaultStyle.semiBold,
                    ),
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
