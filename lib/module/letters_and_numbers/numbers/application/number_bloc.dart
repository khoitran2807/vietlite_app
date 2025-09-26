import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/repository/i_number_repository.dart';

import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:injectable/injectable.dart';

part 'number_event.dart';

part 'number_state.dart';

part 'number_bloc.freezed.dart';

@injectable
class NumbersBloc extends Bloc<NumberEvent, NumberState> {
  final INumberRepository repository;

  NumbersBloc({required this.repository}) : super(NumberState.initial()) {
    on<NumberEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize event) async {
          emit(state.copyWith(isLoading: true, fetchFailure: none()));
          final result = await repository.getNumbers();
          if (isClosed) return;

          //Handle Number result
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  fetchFailure: optionOf(result),
                ),
              );
            },
            (numbers) {
              emit(
                state.copyWith(
                  isLoading: false,
                  numbers: numbers,
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
