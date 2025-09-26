import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/widget/button.dart';
import 'package:vietlite/widget/input/label_input.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/module/user/forget_password/application/forget_password_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/widget/input/input_type.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.s16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              context.lang.forgetPasswordTitle,
              style: context.defaultStyle.s16.bold,
            ),
            SizedBox(height: AppDimensions.s20),
            LabelInput(
              key: WidgetKeys.emailInput,
              label: context.lang.email,
              controller: emailController,
              inputType: InputType.email(),
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  context.read<ForgetPasswordBloc>().add(
                    ForgetPasswordEvent.forgetPassword(
                      email: EmailAddress(emailController.text),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: AppDimensions.s20),
            BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
              buildWhen:
                  (previous, current) =>
                      previous.isForgetPassword != current.isForgetPassword,
              builder: (context, state) {
                return (!state.isForgetPassword)
                    ? Button.primary(
                      key: WidgetKeys.forgetPasswordButton,
                      buttonName: context.lang.next,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgetPasswordBloc>().add(
                            ForgetPasswordEvent.forgetPassword(
                              email: EmailAddress(emailController.text),
                            ),
                          );
                        }
                      },
                    )
                    : Center(
                      child: Loading.small(
                        key: WidgetKeys.forgetPasswordLoading,
                      ),
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
    );
  }
}
