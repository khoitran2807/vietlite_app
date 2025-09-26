import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/repository/i_discover_repository.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:injectable/injectable.dart';

part 'discover_event.dart';

part 'discover_state.dart';

part 'discover_bloc.freezed.dart';

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final IDiscoverRepository repository;

  DiscoverBloc({required this.repository}) : super(DiscoverState.initial()) {
    on<DiscoverEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize event) async {
          emit(state.copyWith(isLoading: true, fetchFailure: none()));
          final results = await repository.getThings();
          if (isClosed) return;

          results.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  fetchFailure: optionOf(results),
                ),
              );
            },
            (things) {
              emit(
                state.copyWith(
                  isLoading: false,
                  things: things,
                  fetchFailure: optionOf(results),
                ),
              );
            },
          );
        },
      );
    });
  }
}
