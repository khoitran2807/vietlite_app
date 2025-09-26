import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/user/register/application/register_bloc.dart';
import 'package:vietlite/module/user/register/presentation/widget/register_form.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:vietlite/module/user/widget/onboarding_layout.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => locator<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listenWhen:
            (previous, current) =>
                previous.failureOrSuccessOption.isNone() &&
                current.failureOrSuccessOption.isSome(),
        listener: (context, state) {
          state.failureOrSuccessOption.map(
            (either) => either.fold(
              (failure) {
                showToast(context, failure.message);
              },
              (_) {
                showToast(context, context.lang.signUpSuccess);
                AppLocator.router.replaceAll([const RootScreenRoute()]);
              },
            ),
          );
        },
        child: const OnboardingLayout(child: RegisterForm()),
      ),
    );
  }
}
