import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/domain/repository/i_things_repository.dart';
import 'package:injectable/injectable.dart';
part 'things_event.dart';
part 'things_state.dart';
part 'things_bloc.freezed.dart';

@injectable
class ThingsBloc extends Bloc<ThingsEvent, ThingsState> {
  final IThingsRepository repository;

  ThingsBloc({required this.repository}) : super(ThingsState.initial()) {
    on<ThingsEvent>((event, emit) async {
      await event.map(
        getThings: (_GetThings value) async {
          emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
          final failureOrThings = await repository.getThings(type: value.type);

          if (isClosed) return;
          failureOrThings.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrThings),
                isLoading: false,
              ),
            ),
            (things) {
              emit(
                state.copyWith(
                  things: things,
                  failureOrSuccessOption: optionOf(failureOrThings),
                  isLoading: false,
                ),
              );
            },
          );
        },
      );
    });
  }
}
