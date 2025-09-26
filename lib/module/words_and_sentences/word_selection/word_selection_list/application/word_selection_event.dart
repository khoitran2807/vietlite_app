part of 'word_selection_bloc.dart';

@freezed
class WordSelectionEvent with _$WordSelectionEvent {
  const factory WordSelectionEvent.initialize({required String userId}) =
      _Initialize;
}
