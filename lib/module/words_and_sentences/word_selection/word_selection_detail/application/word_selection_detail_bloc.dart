import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/domain/repository/i_word_selection_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';

part 'word_selection_detail_event.dart';

part 'word_selection_detail_state.dart';

part 'word_selection_detail_bloc.freezed.dart';

@injectable
class WordSelectionDetailBloc
    extends Bloc<WordSelectionDetailEvent, WordSelectionDetailState> {
  final IWordSelectionDetailRepository repository;
  final IProgressRepository progressRepository;

  WordSelectionDetailBloc({
    required this.progressRepository,
    required this.repository,
  }) : super(WordSelectionDetailState.initial()) {
    on<WordSelectionDetailEvent>((event, emit) async {
      await event.map(
        initialize: (e) async {
          emit(state.copyWith(isLoading: true));

          final results = await Future.wait([
            repository.getWordSelectionDetail(id: e.id),
            progressRepository.getUserExercises(
              userId: e.userId,
              progressId: e.id,
            ),
          ]);

          if (isClosed) return;

          final failureOrSuccessWordSelectionDetail =
              results[0] as Either<AppFailure, WordSelection>;
          final failureOrSuccessUserExercises =
              results[1] as Either<AppFailure, List<UserExercise>>;

          WordSelection updatedWordSelection = state.wordSelection;
          List<UserExercise> updatedExercises = state.exercises;
          Option<Either<AppFailure, dynamic>> fetchFailure = none();

          // Handle word selection detail result
          failureOrSuccessWordSelectionDetail.fold(
            (failure) {
              fetchFailure = optionOf(failureOrSuccessWordSelectionDetail);
            },
            (wordSelection) {
              updatedWordSelection = wordSelection;

              // Handle word selection progress result
              failureOrSuccessUserExercises.fold(
                (failure) {
                  fetchFailure = optionOf(failureOrSuccessUserExercises);
                },
                (userExercises) {
                  updatedExercises = userExercises;
                },
              );

              // Emit the new state with updated values and potential failure.
              emit(
                state.copyWith(
                  isLoading: false,
                  wordSelection: updatedWordSelection,
                  exercises: updatedExercises,
                  fetchFailure: fetchFailure,
                ),
              );
            },
          );
        },
      );
    });
  }
}
