import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/application/word_match_bloc.dart';
import 'package:vietlite/plugin/livechat/livechat_service.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class WordMatchScreen extends StatelessWidget {
  const WordMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) => previous.isLoggedIn != current.isLoggedIn,
      builder: (context, userState) {
        if (userState.appUser.id.isEmpty) {
          return const SizedBox.shrink();
        }
        final userId = userState.appUser.id;
        return BlocProvider(
          create:
              (context) =>
                  locator<WordMatchBloc>()
                    ..add(WordMatchEvent.initialize(userId: userId)),
          child: BlocListener<WordMatchBloc, WordMatchState>(
            listenWhen:
                (previous, current) =>
                    previous.fetchFailure != current.fetchFailure &&
                    current.fetchFailure.isSome(),
            listener: (context, state) {
              state.fetchFailure.map(
                (either) => either.fold(
                  (failure) => showToast(context, context.lang.errorHappened),
                  (_) {
                    context.read<ProgressBloc>().add(
                      ProgressEvent.initWordMatches(
                        wordMatches: state.wordMatches,
                      ),
                    );
                  },
                ),
              );
            },
            child: BlocBuilder<WordMatchBloc, WordMatchState>(
              buildWhen:
                  (previous, current) =>
                      previous.isLoading != current.isLoading ||
                      previous.wordMatches != current.wordMatches,
              builder: (context, wordState) {
                return (wordState.isLoading)
                    ? Center(child: Loading.medium())
                    : BlocBuilder<ProgressBloc, ProgressState>(
                      buildWhen:
                          (previous, current) =>
                              previous.userProgresses != current.userProgresses,
                      builder: (context, progressState) {
                        return ListView.separated(
                          padding: EdgeInsets.all(AppDimensions.s16),
                          itemCount: wordState.wordMatches.length,
                          itemBuilder: (context, index) {
                            final wordMatch = wordState.wordMatches[index];
                            final UserProgress? userProgress = progressState
                                .userProgresses
                                .firstWhereOrNull(
                                  (progress) => progress.id == wordMatch.id,
                                );
                            final completedExercises =
                                userProgress?.completedExercises ?? 0;
                            final isCompleted =
                                completedExercises == wordMatch.totalExercises;
                            final isInProgress =
                                0 < completedExercises &&
                                completedExercises < wordMatch.totalExercises;

                            return InkWell(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.s12,
                              ),
                              onTap:
                                  (!wordMatch.isPremium ||
                                          userState.isWordMatchPremium)
                                      ? () {
                                        AppLocator.router.push(
                                          WordMatchDetailScreenRoute(
                                            id: wordMatch.id,
                                          ),
                                        );
                                      }
                                      : null,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.s16,
                                ),
                                height: AppDimensions.s64,
                                decoration: BoxDecoration(
                                  color: context.color.foreground,
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.s12,
                                  ),
                                  border: Border.all(
                                    color:
                                        (!wordMatch.isPremium ||
                                                userState.isWordMatchPremium)
                                            ? context.color.neutral.shade200
                                            : context.color.neutral.shade300,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: context.color.redColor.shade100,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${index + 1}',
                                        style: context.defaultStyle.bold.s16
                                            .copyWith(
                                              color: context.color.redColor,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: AppDimensions.s12),
                                    (isCompleted)
                                        ? SvgPicture.asset(AppIcons.completed)
                                        : (isInProgress)
                                        ? SvgPicture.asset(AppIcons.inProgress)
                                        : SvgPicture.asset(AppIcons.notStarted),
                                    SizedBox(width: AppDimensions.s12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            wordMatch.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.defaultStyle.bold
                                                .copyWith(
                                                  color:
                                                      (!wordMatch.isPremium ||
                                                              userState
                                                                  .isWordMatchPremium)
                                                          ? context
                                                              .color
                                                              .neutral
                                                          : Colors.grey,
                                                ),
                                          ),
                                          SizedBox(height: AppDimensions.s4),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '$completedExercises',
                                                  style: context.defaultStyle
                                                      .copyWith(
                                                        color:
                                                            (isCompleted)
                                                                ? context
                                                                    .color
                                                                    .secondary
                                                                : (isInProgress)
                                                                ? context
                                                                    .color
                                                                    .primary
                                                                : context
                                                                    .color
                                                                    .redColor,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '/${wordMatch.totalExercises}',
                                                  style: context.defaultStyle
                                                      .copyWith(
                                                        color:
                                                            isCompleted
                                                                ? context
                                                                    .color
                                                                    .secondary
                                                                : context
                                                                    .color
                                                                    .neutral
                                                                    .shade100,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    (wordMatch.isPremium &&
                                            !userState.isWordMatchPremium)
                                        ? TextButton(
                                          onPressed: () {
                                            LivechatService.sendMessage(
                                              context.lang.unlockWordMatch,
                                            );
                                          },
                                          child: Text(
                                            context.lang.unlock,
                                            style:
                                                context.primaryStyle.semiBold,
                                          ),
                                        )
                                        : Icon(
                                          Icons.arrow_forward_ios,
                                          color: context.color.neutral.shade400,
                                          size: 16,
                                        ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: AppDimensions.s12);
                          },
                        );
                      },
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
