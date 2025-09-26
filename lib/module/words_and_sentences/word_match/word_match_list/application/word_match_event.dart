part of 'word_match_bloc.dart';

@freezed
class WordMatchEvent with _$WordMatchEvent {
  const factory WordMatchEvent.initialize({required String userId}) =
      _Initialize;
}
