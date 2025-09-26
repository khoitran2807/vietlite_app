import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/user/forget_password/application/forget_password_bloc.dart';
import 'package:vietlite/module/user/forget_password/presentation/widget/forget_password_form.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:vietlite/module/user/widget/onboarding_layout.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ForgetPasswordBloc>(),
      child: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
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
                showToast(context, context.lang.forgetPasswordSuccess);
                AppLocator.router.replaceAll([const LoginScreenRoute()]);
              },
            ),
          );
        },
        child: const OnboardingLayout(child: ForgetPasswordForm()),
      ),
    );
  }
}
