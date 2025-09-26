part of 'word_selection_detail_bloc.dart';

@freezed
class WordSelectionDetailEvent with _$WordSelectionDetailEvent {
  const factory WordSelectionDetailEvent.initialize({
    required String id,
    required String userId,
    required String progressId,
  }) = _Initialize;
}
