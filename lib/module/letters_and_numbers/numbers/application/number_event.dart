part of 'number_bloc.dart';

@freezed
class NumberEvent with _$NumberEvent {
  const factory NumberEvent.initialize({required String userId}) = _Initialize;
}
