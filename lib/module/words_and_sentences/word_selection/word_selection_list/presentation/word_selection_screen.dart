import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/common/extension/text_style.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/application/word_selection_bloc.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:collection/collection.dart';

@RoutePage()
class WordSelectionScreen extends StatelessWidget {
  const WordSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) =>
              previous.isLoggedIn != current.isLoggedIn ||
              previous.isWordSelectionPremium != current.isWordSelectionPremium,
      builder: (context, userState) {
        if (userState.appUser.id.isEmpty) {
          return const SizedBox.shrink();
        }
        final userId = userState.appUser.id;
        return BlocProvider(
          create:
              (context) =>
                  locator<WordSelectionBloc>()
                    ..add(WordSelectionEvent.initialize(userId: userId)),
          child: BlocListener<WordSelectionBloc, WordSelectionState>(
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
                      ProgressEvent.initWordSelections(
                        wordSelections: state.wordSelections,
                      ),
                    );
                  },
                ),
              );
            },
            child: BlocBuilder<WordSelectionBloc, WordSelectionState>(
              buildWhen:
                  (previous, current) =>
                      previous.isLoading != current.isLoading ||
                      previous.wordSelections != current.wordSelections,
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
                          itemCount: wordState.wordSelections.length,
                          itemBuilder: (context, index) {
                            final wordSelection =
                                wordState.wordSelections[index];
                            final UserProgress? userProgress = progressState
                                .userProgresses
                                .firstWhereOrNull(
                                  (progress) => progress.id == wordSelection.id,
                                );
                            final completedExercises =
                                userProgress?.completedExercises ?? 0;
                            final isCompleted =
                                completedExercises ==
                                wordSelection.totalExercises;
                            final isInProgress =
                                0 < completedExercises &&
                                completedExercises <
                                    wordSelection.totalExercises;

                            return InkWell(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.s12,
                              ),
                              onTap:
                                  (!wordSelection.isPremium ||
                                          userState.isWordSelectionPremium)
                                      ? () {
                                        AppLocator.router.push(
                                          WordSelectionDetailScreenRoute(
                                            id: wordSelection.id,
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
                                        (!wordSelection.isPremium ||
                                                userState
                                                    .isWordSelectionPremium)
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
                                            wordSelection.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.defaultStyle.bold
                                                .copyWith(
                                                  color:
                                                      (!wordSelection
                                                                  .isPremium ||
                                                              userState
                                                                  .isWordSelectionPremium)
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
                                                      '/${wordSelection.totalExercises}',
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
                                    Icon(
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
