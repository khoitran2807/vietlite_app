import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/login/application/login_bloc.dart';
import 'package:vietlite/module/user/login/presentation/widget/login_form.dart';
import 'package:vietlite/module/user/widget/onboarding_layout.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => locator<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
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
                // when logged in anonymous, we do not need to display toast message
                AuthState authState = context.read<AuthBloc>().state;
                if (authState.isLoggedInWithEmail) {
                  showToast(context, context.lang.signInSuccess);
                }
                AppLocator.router.replaceAll([const RootScreenRoute()]);
              },
            ),
          );
        },
        child: const OnboardingLayout(child: LoginForm()),
      ),
    );
  }
}
