part of 'thing_detail_bloc.dart';

@freezed
class ThingDetailEvent with _$ThingDetailEvent {
  const factory ThingDetailEvent.getThingDetail({
    required String id,
    required String userId,
  }) = _GetThingDetail;
}
