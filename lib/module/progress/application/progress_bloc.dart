import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:injectable/injectable.dart';

part 'progress_event.dart';

part 'progress_state.dart';

part 'progress_bloc.freezed.dart';

@injectable
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final IProgressRepository repository;

  ProgressBloc({required this.repository}) : super(ProgressState.initial()) {
    on<ProgressEvent>((event, emit) async {
      await event.map(
        getUserProgresses: (event) async {
          final failureOrSuccess = await repository.getUserProgresses(
            userId: event.userId,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                fetchFailure: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            ),
            (progresses) {
              emit(
                state.copyWith(
                  userProgresses: progresses,
                  fetchFailure: optionOf(failureOrSuccess),
                  isLoading: false,
                ),
              );
            },
          );
        },
        updateProgress: (event) async {
          final UserProgress? oldProgress = state.userProgresses
              .firstWhereOrNull((p) => p.id == event.progress.id);
          final progressToPut =
              (event.progress.exercises.isNotEmpty && oldProgress != null)
                  ? event.progress.copyWith(
                    exercises: [
                      event.progress.exercises.first,
                      ...oldProgress.exercises.where(
                        (e) => e.id != event.progress.exercises.first.id,
                      ),
                    ],
                  )
                  : event.progress;
          final List<UserProgress> updatedUserProgresses = [
            progressToPut,
            ...state.userProgresses.where((p) => p.id != event.progress.id),
          ];
          emit(state.copyWith(userProgresses: updatedUserProgresses));
        },
        initLetters: (event) {
          emit(state.copyWith(letters: event.letters));
        },

        initNumbers: (event) {
          emit(state.copyWith(numbers: event.numbers));
        },
        initThings: (event) {
          emit(state.copyWith(things: event.things));
        },
        initWordSelections: (event) {
          emit(state.copyWith(wordSelections: event.wordSelections));
        },
        initWordMatches: (event) {
          emit(state.copyWith(wordMatches: event.wordMatches));
        },
      );
    });
  }
}
