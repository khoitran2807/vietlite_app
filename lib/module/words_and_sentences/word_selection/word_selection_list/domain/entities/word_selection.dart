import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_selection.freezed.dart';

@freezed
class WordSelection with _$WordSelection {
  const WordSelection._();

  const factory WordSelection({
    required String id,
    required String title,
    required int totalExercises,
    required int order,
    required bool isPremium,
    required List<WordSelectionExercise> exercises,
  }) = _WordSelection;

  factory WordSelection.empty() => const WordSelection(
    id: '',
    title: '',
    order: 0,
    exercises: [],
    totalExercises: 0,
    isPremium: false,
  );
}

@freezed
class WordSelectionExercise with _$WordSelectionExercise {
  const WordSelectionExercise._();

  const factory WordSelectionExercise({
    required String id,
    required List<String> choices,
    required String question,
    required String answer,
  }) = _WordSelectionExercise;

  factory WordSelectionExercise.empty() => const WordSelectionExercise(
    id: '',
    choices: [],
    question: '',
    answer: '',
  );
}
