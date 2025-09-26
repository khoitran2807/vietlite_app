import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_match.freezed.dart';

@freezed
class WordMatch with _$WordMatch {
  const WordMatch._();

  const factory WordMatch({
    required String id,
    required String title,
    required int order,
    required int totalExercises,
    required bool isPremium,
    required List<WordMatchExercise> exercises,
  }) = _WordMatch;

  factory WordMatch.empty() => const WordMatch(
    id: '',
    title: '',
    order: 0,
    exercises: [],
    isPremium: false,
    totalExercises: 0,
  );
}

@freezed
class WordMatchExercise with _$WordMatchExercise {
  const WordMatchExercise._();

  const factory WordMatchExercise({
    required String id,
    required List<String> choices,
    required String answer,
    required String image,
  }) = _WordMatchExercise;

  factory WordMatchExercise.empty() =>
      const WordMatchExercise(id: '', choices: [], answer: '', image: '');
}
