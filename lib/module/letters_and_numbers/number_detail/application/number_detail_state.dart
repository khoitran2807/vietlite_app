part of 'number_detail_bloc.dart';

@freezed
class NumberDetailState with _$NumberDetailState {
  const factory NumberDetailState({
    required bool isLoading,
    required Number number,
    required Option<Either<AppFailure, Number>> failureOrSuccessOption,
    required Option<Either<AppFailure, Unit>> fetchNumberDetailProgress,
  }) = _NumberDetailState;

  factory NumberDetailState.initial() => NumberDetailState(
    number: Number.empty(),
    isLoading: false,
    failureOrSuccessOption: none(),
    fetchNumberDetailProgress: none(),
  );
}
