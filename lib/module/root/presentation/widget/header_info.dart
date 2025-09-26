import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/button.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.appUser != current.appUser,
      builder: (context, state) {
        return (state.isLoggedInWithEmail)
            ? _buildLoggedIn(state, context)
            : _buildNotLoggedIn(state, context);
      },
    );
  }

  Widget _buildNotLoggedIn(AuthState authState, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _buildGreeting(authState, context),
          SizedBox(
            width: AppDimensions.s130,
            child: Button.primary(
              buttonName: context.lang.signIn,
              onPressed: () {
                AppLocator.router.push(const LoginScreenRoute());
              },
            ),
          ),
          const Divider(),
          Text(context.lang.registerMessage),
        ],
      ),
    );
  }

  Widget _buildLoggedIn(AuthState authState, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.s32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${context.lang.greeting}, ${authState.appUser.name}',
              overflow: TextOverflow.ellipsis,
              style: context.defaultStyle.semiBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting(AuthState authState, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimensions.s8),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.lang.greeting,
              style: context.defaultStyle.s16.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}
