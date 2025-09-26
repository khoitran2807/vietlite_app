part of 'word_match_detail_bloc.dart';

@freezed
class WordMatchDetailEvent with _$WordMatchDetailEvent {
  const factory WordMatchDetailEvent.initialize({
    required String id,
    required String userId,
    required String progressId,
  }) = _Initialize;
}
