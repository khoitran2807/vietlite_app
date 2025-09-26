import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/setting/application/setting_bloc.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/presentation/widget/change_password_form.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/alert_dialog.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;

    return BlocListener<SettingBloc, SettingState>(
      listenWhen:
          (previous, current) =>
              previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption &&
              current.failureOrSuccessOption.isSome(),
      listener: (context, state) {
        state.failureOrSuccessOption.map(
          (either) => either.fold(
            (failure) => showToast(context, failure.message),
            (_) => showToast(context, context.lang.settingSuccess),
          ),
        );
      },
      child: AppScaffold(
        title: (context.isTablet) ? '' : context.lang.setting,
        autoImplyLeading: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.s16,
            right: AppDimensions.s16,
            bottom: AppDimensions.s16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppDimensions.s16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.s8),
                    border: Border.all(
                      color: context.color.neutral.shade200,
                      width: 1,
                    ),
                    color: context.color.foreground,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(
                          left: AppDimensions.s16,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.lang.freeAI,
                              style: context.defaultStyle.semiBold,
                            ),
                            TextButton(
                              onPressed: () async {
                                final Uri uri = Uri.parse(
                                  'https://sutuaiworld.com/video',
                                );
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              },
                              child: Text(
                                context.lang.viewNow,
                                style: context.primaryStyle.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.s16,
                        ),
                        child: Divider(
                          height: 1,
                          color: context.color.neutral.shade200,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(
                          left: AppDimensions.s16,
                          right: AppDimensions.s8,
                        ),
                        title: Row(
                          children: [
                            Text(
                              context.lang.language,
                              style: context.defaultStyle.semiBold,
                            ),
                            const Spacer(),
                            ...LanguageCode.values.map((lang) {
                              return InkWell(
                                onTap: () {
                                  context.read<SettingBloc>().add(
                                    SettingEvent.changeLocale(
                                      language: AppLanguage(languageCode: lang),
                                    ),
                                  );
                                },
                                child: BlocBuilder<SettingBloc, SettingState>(
                                  buildWhen:
                                      (previous, current) =>
                                          previous.language != current.language,
                                  builder: (context, state) {
                                    final isSelected =
                                        lang == state.language.languageCode;

                                    return Container(
                                      width: 64,
                                      height: 24,
                                      margin: EdgeInsets.only(
                                        left: AppDimensions.s16,
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                  Radius.circular(4),
                                                ),
                                            child: Image.asset(
                                              lang.flag,
                                              fit: BoxFit.cover,
                                              width: 32,
                                              height: 20,
                                            ),
                                          ),
                                          SizedBox(width: AppDimensions.s4),
                                          Icon(
                                            isSelected
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            color:
                                                isSelected
                                                    ? context.color.secondary
                                                    : Colors.grey,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      (authState.isLoggedInWithEmail)
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.s16,
                                ),
                                child: Divider(
                                  height: 1,
                                  color: context.color.neutral.shade200,
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.only(
                                  left: AppDimensions.s16,
                                  right: AppDimensions.s16,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context.lang.email,
                                      style: context.defaultStyle.semiBold,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          authState.appUser.email,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.defaultStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.s16,
                                ),
                                child: Divider(
                                  height: 1,
                                  color: context.color.neutral.shade200,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  context.lang.changePassword,
                                  style: context.defaultStyle.semiBold,
                                ),
                                onTap: () {
                                  showAppDialog(
                                    context: context,
                                    body: const ChangePasswordForm(),
                                  );
                                },
                              ),
                            ],
                          )
                          : const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.s24),

                InkWell(
                  onTap: () {
                    if (authState.isLoggedInAnonymous) {
                      AppLocator.router.replaceAll([const LoginScreenRoute()]);
                    } else {
                      context.read<AuthBloc>().add(const AuthEvent.signOut());
                      AppLocator.router.replaceAll([const LoginScreenRoute()]);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        (authState.isLoggedInAnonymous)
                            ? Icon(Icons.login, color: context.color.primary)
                            : Icon(Icons.logout, color: context.color.redColor),
                        const SizedBox(width: 8),
                        Text(
                          (authState.isLoggedInAnonymous)
                              ? context.lang.signIn
                              : context.lang.signOut,
                          style: context.defaultStyle.s16.semiBold.copyWith(
                            color:
                                (authState.isLoggedInAnonymous)
                                    ? context.color.primary
                                    : context.color.redColor,
                          ),
                        ),
                      ],
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
