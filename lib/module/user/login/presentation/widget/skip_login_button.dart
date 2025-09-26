part of 'package:vietlite/module/user/login/presentation/widget/login_form.dart';

class _SkipLoginButton extends StatelessWidget {
  const _SkipLoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen:
          (previous, current) =>
              previous.isAnonymousSignIn != current.isAnonymousSignIn,
      builder: (context, state) {
        return (state.isAnonymousSignIn)
            ? Loading.small(key: WidgetKeys.anonymousSignInLoading)
            : InkWell(
              key: WidgetKeys.skipLoginButton,
              onTap: () {
                context.read<LoginBloc>().add(
                  const LoginEvent.anonymousSignIn(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.lang.experienceNow,
                    style: context.primaryStyle.semiBold,
                  ),
                  Icon(Icons.navigate_next, color: context.color.primary),
                ],
              ),
            );
      },
    );
  }
}
