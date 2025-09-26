part of 'letter_detail_bloc.dart';

@freezed
class LetterDetailEvent with _$LetterDetailEvent {
  const factory LetterDetailEvent.getLetterDetail({
    required String id,
    required String userId,
  }) = _GetLetterDetail;
  const factory LetterDetailEvent.updateLetterDetailProgress({
    required String userId,
    required String progressId,
  }) = _UpdateLetterDetailProgress;
}
