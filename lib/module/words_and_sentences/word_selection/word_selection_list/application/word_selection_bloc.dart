import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/repository/i_word_selection_repository.dart';

part 'word_selection_event.dart';

part 'word_selection_state.dart';

part 'word_selection_bloc.freezed.dart';

@injectable
class WordSelectionBloc extends Bloc<WordSelectionEvent, WordSelectionState> {
  final IWordSelectionRepository repository;

  WordSelectionBloc({required this.repository})
    : super(WordSelectionState.initial()) {
    on<WordSelectionEvent>((event, emit) async {
      await event.map(
        initialize: (e) async {
          emit(state.copyWith(isLoading: true));
          final result = await repository.getWordSelections();
          if (isClosed) return;

          //Handle wordSelection result
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  fetchFailure: optionOf(result),
                ),
              );
            },
            (wordSelections) {
              emit(
                state.copyWith(
                  isLoading: false,
                  wordSelections: wordSelections,
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
