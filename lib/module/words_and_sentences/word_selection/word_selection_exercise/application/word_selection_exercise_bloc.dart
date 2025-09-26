import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';

part 'word_selection_exercise_event.dart';

part 'word_selection_exercise_state.dart';

part 'word_selection_exercise_bloc.freezed.dart';

@injectable
class WordSelectionExerciseBloc
    extends Bloc<WordSelectionExerciseEvent, WordSelectionExerciseState> {
  final IProgressRepository repository;

  WordSelectionExerciseBloc({required this.repository})
    : super(WordSelectionExerciseState.initial()) {
    on<WordSelectionExerciseEvent>((event, emit) async {
      await event.map(
        initialize: (e) async {
          emit(
            state.copyWith(
              exercise: e.exercise,
              selectedAnswer: e.lastAnswer,
              isAnswered: e.lastAnswer != null,
            ),
          );
        },
        selectAnswer: (e) async {
          if (state.selectedAnswer != e.selectedAnswer) {
            emit(
              state.copyWith(
                selectedAnswer: e.selectedAnswer,
                isAnswered: false,
              ),
            );
          }
        },
        updateAnswerProgress: (e) async {
          const exerciseType = ExerciseType.wordSelection;
          emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));

          final failureOrSuccess = await repository.updateUserProgress(
            userId: e.userId,
            progressId: e.progressId,
            exerciseType: exerciseType,
            exerciseId: state.exercise.id,
            lastAnswer: state.selectedAnswer!,
            isCorrect: state.isCorrect,
            totalExercises: e.totalExercises,
          );
          emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        checkAnswer: (e) {
          emit(state.copyWith(isAnswered: true));
        },
      );
    });
  }
}
