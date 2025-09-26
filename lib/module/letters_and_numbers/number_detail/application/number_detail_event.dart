part of 'number_detail_bloc.dart';

@freezed
class NumberDetailEvent with _$NumberDetailEvent {
  const factory NumberDetailEvent.getNumberDetail({
    required String id,
    required String userId,
  }) = _GetNumberDetail;
  const factory NumberDetailEvent.updateNumberDetailProgress({
    required String userId,
    required String progressId,
  }) = _UpdateNumberDetailProgress;
}
