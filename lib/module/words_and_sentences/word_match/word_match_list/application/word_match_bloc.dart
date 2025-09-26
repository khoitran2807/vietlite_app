import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/repository/i_word_match_repository.dart';
import 'package:injectable/injectable.dart';

part 'word_match_event.dart';

part 'word_match_state.dart';

part 'word_match_bloc.freezed.dart';

@injectable
class WordMatchBloc extends Bloc<WordMatchEvent, WordMatchState> {
  final IWordMatchRepository repository;

  WordMatchBloc({required this.repository}) : super(WordMatchState.initial()) {
    on<WordMatchEvent>((event, emit) async {
      await event.map(
        initialize: (e) async {
          emit(state.copyWith(isLoading: true));
          final result = await repository.getWordMatches();
          if (isClosed) return;

          //Handle wordMatch result
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  fetchFailure: optionOf(result),
                ),
              );
            },
            (wordMatches) {
              emit(
                state.copyWith(
                  isLoading: false,
                  wordMatches: wordMatches,
                  fetchFailure: optionOf(result),
                ),
              );
            },
          );
        },
      );
    });
  }
}
