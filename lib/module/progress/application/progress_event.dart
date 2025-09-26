part of 'progress_bloc.dart';

@freezed
class ProgressEvent with _$ProgressEvent {
  const factory ProgressEvent.getUserProgresses({required String userId}) =
      _GetUserProgresses;

  const factory ProgressEvent.updateProgress({required UserProgress progress}) =
      _UpdateProgress;

  const factory ProgressEvent.initLetters({required List<Letter> letters}) =
      _InitLetters;

  const factory ProgressEvent.initNumbers({required List<Number> numbers}) =
      _InitNumbers;

  const factory ProgressEvent.initThings({required List<Thing> things}) =
      _InitThings;

  const factory ProgressEvent.initWordSelections({
    required List<WordSelection> wordSelections,
  }) = _InitWordSelections;

  const factory ProgressEvent.initWordMatches({
    required List<WordMatch> wordMatches,
  }) = _InitWordMatches;
}
