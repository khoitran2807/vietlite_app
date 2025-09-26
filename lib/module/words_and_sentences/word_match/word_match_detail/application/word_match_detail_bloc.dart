import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/domain/repository/i_word_match_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:injectable/injectable.dart';

part 'word_match_detail_event.dart';

part 'word_match_detail_state.dart';

part 'word_match_detail_bloc.freezed.dart';

@injectable
class WordMatchDetailBloc
    extends Bloc<WordMatchDetailEvent, WordMatchDetailState> {
  final IWordMatchDetailRepository repository;
  final IProgressRepository progressRepository;

  WordMatchDetailBloc({
    required this.progressRepository,
    required this.repository,
  }) : super(WordMatchDetailState.initial()) {
    on<WordMatchDetailEvent>((event, emit) async {
      await event.map(
        initialize: (e) async {
          emit(state.copyWith(isLoading: true));

          final results = await Future.wait([
            repository.getWordMatchDetail(id: e.id),
            progressRepository.getUserExercises(
              userId: e.userId,
              progressId: e.id,
            ),
          ]);

          if (isClosed) return;
          final failureOrSuccessWordMatchDetail =
              results[0] as Either<AppFailure, WordMatch>;
          final failureOrSuccessUserExercises =
              results[1] as Either<AppFailure, List<UserExercise>>;

          WordMatch updatedWordMatch = state.wordMatch;
          List<UserExercise> updatedExercises = state.exercises;
          Option<Either<AppFailure, dynamic>> fetchFailure = none();

          // Handle word match detail result
          failureOrSuccessWordMatchDetail.fold(
            (failure) {
              fetchFailure = optionOf(failureOrSuccessWordMatchDetail);
            },
            (wordMatch) {
              updatedWordMatch = wordMatch;

              // Handle word match progress result
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
                  wordMatch: updatedWordMatch,
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
