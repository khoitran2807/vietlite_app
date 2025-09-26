import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/widget/button.dart';
import 'package:vietlite/widget/input/input_type.dart';
import 'package:vietlite/widget/input/label_input.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen:
          (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.map(
          (either) => either.fold(
            (failure) {
              showToast(context, failure.message);
            },
            (_) {
              showToast(context, context.lang.changePasswordSuccess);
              Navigator.of(context).pop();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelInput(
                  key: WidgetKeys.currentPasswordInput,
                  label: context.lang.currentPassword,
                  controller: currentPasswordController,
                  inputType: InputType.password(),
                ),
                SizedBox(height: AppDimensions.s8),
                LabelInput(
                  key: WidgetKeys.newPasswordInput,
                  label: context.lang.newPassword,
                  controller: newPasswordController,
                  inputType: InputType.password(),
                ),
                SizedBox(height: AppDimensions.s8),
                LabelInput(
                  key: WidgetKeys.confirmPasswordInput,
                  label: context.lang.confirmPassword,
                  controller: confirmPasswordController,
                  inputType: InputType.rePassword(newPasswordController),
                ),
                SizedBox(height: AppDimensions.s20),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: Loading.medium(
                          key: WidgetKeys.changePasswordLoading,
                        ),
                      );
                    }
                    return Button.primary(
                      buttonName: context.lang.confirm,
                      key: WidgetKeys.changePasswordButton,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final currentPassword =
                              currentPasswordController.text.trim();
                          final newPassword = newPasswordController.text.trim();
                          context.read<AuthBloc>().add(
                            AuthEvent.changePassword(
                              currentPassword: currentPassword,
                              newPassword: newPassword,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: AppDimensions.s8),
                Center(
                  child: InkWell(
                    onTap: () => AppLocator.router.maybePop(),
                    key: WidgetKeys.cancelChangePassword,
                    child: Text(
                      context.lang.cancel,
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
