part of 'discover_bloc.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    required List<Thing> things,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _DiscoverState;

  factory DiscoverState.initial() =>
      DiscoverState(things: [], isLoading: false, fetchFailure: none());
}
