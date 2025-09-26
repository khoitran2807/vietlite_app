part of 'number_bloc.dart';

@freezed
class NumberState with _$NumberState {
  const factory NumberState({
    required List<Number> numbers,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _NumberState;

  factory NumberState.initial() =>
      NumberState(numbers: [], isLoading: false, fetchFailure: none());
}
