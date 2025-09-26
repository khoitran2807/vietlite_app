import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/domain/repository/i_letter_detail_repository.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:injectable/injectable.dart';

part 'letter_detail_event.dart';

part 'letter_detail_state.dart';

part 'letter_detail_bloc.freezed.dart';

@injectable
class LetterDetailBloc extends Bloc<LetterDetailEvent, LetterDetailState> {
  final ILetterDetailRepository repository;
  final IProgressRepository progressRepository;

  LetterDetailBloc({required this.repository, required this.progressRepository})
    : super(LetterDetailState.initial()) {
    on<LetterDetailEvent>((event, emit) async {
      await event.map(
        getLetterDetail: (e) async {
          emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));

          final failureOrLetter = await repository.getLetterDetail(id: e.id);
          if (isClosed) return;

          failureOrLetter.fold(
            (failure) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrLetter),
                  isLoading: false,
                ),
              );
            },
            (letter) async {
              emit(
                state.copyWith(
                  letter: letter,
                  failureOrSuccessOption: optionOf(failureOrLetter),
                  isLoading: false,
                ),
              );
            },
          );
        },
        updateLetterDetailProgress: (e) async {
          emit(state.copyWith(fetchLetterDetailProgress: none()));
          final failureOrSuccess = await progressRepository.updateUserProgress(
            userId: e.userId,
            progressId: e.progressId,
            exerciseType: ExerciseType.letter,
          );

          if (isClosed) return;

          emit(
            state.copyWith(
              fetchLetterDetailProgress: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
  }
}
