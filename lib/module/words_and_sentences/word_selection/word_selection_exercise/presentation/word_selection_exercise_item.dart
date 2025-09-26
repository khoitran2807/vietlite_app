import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/widget/toast.dart';

import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';

class WordSelectionExerciseItem extends StatelessWidget {
  final WordSelectionExercise exercise;
  final WordSelection wordSelection;
  final String? lastAnswer;

  const WordSelectionExerciseItem({
    super.key,
    required this.exercise,
    required this.wordSelection,
    this.lastAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              locator<WordSelectionExerciseBloc>()..add(
                WordSelectionExerciseEvent.initialize(
                  exercise: exercise,
                  lastAnswer: lastAnswer,
                ),
              ),
      child: BlocListener<
        WordSelectionExerciseBloc,
        WordSelectionExerciseState
      >(
        listenWhen:
            (previous, current) =>
                previous.failureOrSuccessOption !=
                    current.failureOrSuccessOption &&
                current.failureOrSuccessOption.isSome(),
        listener: (context, state) {
          state.failureOrSuccessOption.map(
            (either) => either.fold(
              (failure) => showToast(context, failure.message),
              (_) {
                context.read<ProgressBloc>().add(
                  ProgressEvent.updateProgress(
                    progress: UserProgress(
                      id: wordSelection.id,
                      exerciseType: ExerciseType.wordSelection,
                      writeAt: DateTime.now(),
                      exercises: [
                        UserExercise(
                          id: exercise.id,
                          lastAnswer: state.selectedAnswer!,
                          isCorrect: state.isCorrect,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        child: BlocBuilder<
          WordSelectionExerciseBloc,
          WordSelectionExerciseState
        >(
          buildWhen:
              (previous, current) =>
                  previous.isAnswered != current.isAnswered ||
                  previous.isLoading != current.isLoading ||
                  previous.selectedAnswer != current.selectedAnswer ||
                  previous.exercise != current.exercise,
          builder: (context, state) {
            final userState = context.read<AuthBloc>().state;
            final userId = userState.appUser.id;
            return StackLoading(
              loading: Loading.medium(),
              processing: state.isLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppDimensions.s62,
                    decoration: BoxDecoration(
                      color:
                          state.isAnswered
                              ? (state.isCorrect
                                  ? context.color.secondary.shade100
                                  : context.color.redColor.shade100)
                              : context.color.neutral.shade300,
                      borderRadius: BorderRadius.circular(AppDimensions.s8),
                      border:
                          state.isAnswered
                              ? null
                              : Border.all(
                                color: context.color.neutral.shade200,
                                width: 2,
                              ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            state.isAnswered
                                ? state.exercise.question.replaceAll(
                                  '...',
                                  state.selectedAnswer ?? '...',
                                )
                                : state.exercise.question,
                            style: TextStyle(
                              fontFamily: 'iCielPony',
                              fontSize: AppDimensions.s16,
                              color:
                                  state.isAnswered
                                      ? (state.isCorrect
                                          ? context.color.secondary
                                          : context.color.redColor)
                                      : context.color.neutral.shade400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        if (state.isAnswered)
                          Padding(
                            padding: EdgeInsets.only(left: AppDimensions.s8),
                            child: Icon(
                              state.isCorrect
                                  ? Icons.check_circle
                                  : Icons.cancel_rounded,
                              color:
                                  state.isCorrect
                                      ? context.color.secondary
                                      : context.color.redColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.s16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.exercise.choices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppDimensions.s8,
                      mainAxisSpacing: AppDimensions.s16,
                      mainAxisExtent: AppDimensions.s62,
                    ),
                    itemBuilder: (context, choiceIndex) {
                      final choice = state.exercise.choices[choiceIndex];
                      final isSelected = state.selectedAnswer == choice;
                      return InkWell(
                        onTap:
                            state.isLoading
                                ? null
                                : () {
                                  context.read<WordSelectionExerciseBloc>().add(
                                    WordSelectionExerciseEvent.selectAnswer(
                                      selectedAnswer: choice,
                                    ),
                                  );
                                },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? context.color.secondary.shade100
                                    : context.color.neutral.shade300,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.s8,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? context.color.secondary
                                      : context.color.neutral.shade200,
                              width: 2, // Border thickness
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontFamily: 'iCielPony',
                              fontSize: AppDimensions.s24,
                              color:
                                  isSelected
                                      ? context.color.secondary
                                      : context.color.neutral.shade400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppDimensions.s16),

                  if (!userState.isLoggedInWithEmail &&
                      state.selectedAnswer != null &&
                      !state.isLoading)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Bạn cần đăng nhập để lưu lại tiến độ học tập!',
                        style: context.defaultStyle,
                      ),
                    ),

                  InkWell(
                    onTap:
                        (state.selectedAnswer != null && !state.isLoading)
                            ? () {
                              context.read<WordSelectionExerciseBloc>().add(
                                const WordSelectionExerciseEvent.checkAnswer(),
                              );
                              final signedInWithEmail =
                                  context.read<AuthBloc>().state.appUser.email;
                              if (signedInWithEmail.isNotEmpty) {
                                context.read<WordSelectionExerciseBloc>().add(
                                  WordSelectionExerciseEvent.updateAnswerProgress(
                                    userId: userId,
                                    progressId: wordSelection.id,
                                    totalExercises:
                                        wordSelection.exercises.length,
                                  ),
                                );
                              }
                            }
                            : null,
                    child: Container(
                      height: AppDimensions.s62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.s8),
                        color:
                            state.selectedAnswer != null
                                ? context.color.primary
                                : context.color.neutral.shade300,
                        border:
                            state.selectedAnswer != null
                                ? null
                                : Border.all(
                                  color: context.color.neutral.shade200,
                                  width: 2, // Border thickness
                                ),
                      ),
                      child: Center(
                        child: Text(
                          context.lang.confirmSelection,
                          style: context.defaultStyle.bold.s16.copyWith(
                            color:
                                state.selectedAnswer != null
                                    ? context.color.foreground
                                    : context.color.neutral.shade100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.s8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
