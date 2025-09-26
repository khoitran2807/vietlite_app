part of 'things_bloc.dart';

@freezed
class ThingsState with _$ThingsState {
  const factory ThingsState({
    required List<Thing> things,
    required bool isLoading,
    required Option<Either<AppFailure, List<Thing>>> failureOrSuccessOption,
  }) = _ThingsState;

  factory ThingsState.initial() =>
      ThingsState(things: [], isLoading: false, failureOrSuccessOption: none());
}
