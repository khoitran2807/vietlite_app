import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/domain/repository/i_number_detail_repository.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:injectable/injectable.dart';

part 'number_detail_event.dart';

part 'number_detail_state.dart';

part 'number_detail_bloc.freezed.dart';

@injectable
class NumberDetailBloc extends Bloc<NumberDetailEvent, NumberDetailState> {
  final INumberDetailRepository repository;
  final IProgressRepository progressRepository;

  NumberDetailBloc({required this.repository, required this.progressRepository})
    : super(NumberDetailState.initial()) {
    on<NumberDetailEvent>((event, emit) async {
      await event.map(
        getNumberDetail: (e) async {
          emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
          final failureOrNumber = await repository.getNumberDetail(id: e.id);
          if (isClosed) return;
          failureOrNumber.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrNumber),
                isLoading: false,
              ),
            ),
            (number) {
              emit(
                state.copyWith(
                  number: number,
                  failureOrSuccessOption: optionOf(failureOrNumber),
                  isLoading: false,
                ),
              );
            },
          );
        },
        updateNumberDetailProgress: (e) async {
          emit(state.copyWith(fetchNumberDetailProgress: none()));

          final failureOrSuccess = await progressRepository.updateUserProgress(
            userId: e.userId,
            progressId: e.progressId,
            exerciseType: ExerciseType.number,
          );
          if (isClosed) return;

          emit(
            state.copyWith(
              fetchNumberDetailProgress: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
  }
}
