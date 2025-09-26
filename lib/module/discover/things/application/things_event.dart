part of 'things_bloc.dart';

@freezed
class ThingsEvent with _$ThingsEvent {
  const factory ThingsEvent.getThings({required ThingType type}) = _GetThings;
}
