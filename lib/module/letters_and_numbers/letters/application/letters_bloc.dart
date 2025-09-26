import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/repository/i_letter_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';

part 'letters_event.dart';

part 'letters_state.dart';

part 'letters_bloc.freezed.dart';

@injectable
class LettersBloc extends Bloc<LettersEvent, LettersState> {
  final ILetterRepository repository;

  LettersBloc({required this.repository}) : super(LettersState.initial()) {
    on<LettersEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize event) async {
          emit(state.copyWith(isLoading: true, fetchFailure: none()));
          final result = await repository.getLetters();
          if (isClosed) return;

          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  fetchFailure: optionOf(result),
                ),
              );
            },
            (letters) {
              emit(
                state.copyWith(
                  isLoading: false,
                  letters: letters,
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
