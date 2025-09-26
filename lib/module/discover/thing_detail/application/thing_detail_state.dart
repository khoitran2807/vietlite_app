part of 'thing_detail_bloc.dart';

@freezed
class ThingDetailState with _$ThingDetailState {
  const factory ThingDetailState({
    required bool isLoading,
    required Thing thing,
    required List<UserExercise> exercises,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _ThingDetailState;

  factory ThingDetailState.initial() => ThingDetailState(
    thing: Thing.empty(),
    exercises: [],
    isLoading: true,
    failureOrSuccessOption: none(),
  );
}
