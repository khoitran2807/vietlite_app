import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
part 'word_selection_dto.freezed.dart';

part 'word_selection_dto.g.dart';

@freezed
class WordSelectionDto with _$WordSelectionDto {
  const WordSelectionDto._();

  const factory WordSelectionDto({
    required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: 0) required int totalExercises,
    @JsonKey(defaultValue: 0) required int order,
    @JsonKey(defaultValue: [])
    required List<WordSelectionExerciseDto> exercises,
    @JsonKey(defaultValue: false) required bool isPremium,
  }) = _WordSelectionDto;

  factory WordSelectionDto.fromJson(Map<String, dynamic> json) =>
      _$WordSelectionDtoFromJson(json);

  /// Convert DTO to Domain Entity
  WordSelection get toDomain {
    return WordSelection(
      id: id,
      title: title,
      order: order,
      totalExercises: totalExercises,
      exercises: exercises.map((e) => e.toDomain).toList(),
      isPremium: isPremium,
    );
  }
}

@freezed
class WordSelectionExerciseDto with _$WordSelectionExerciseDto {
  const WordSelectionExerciseDto._();

  const factory WordSelectionExerciseDto({
    required String id,
    @JsonKey(defaultValue: '') required String answer,
    @JsonKey(defaultValue: <String>[]) required List<String> choices,
    @JsonKey(defaultValue: '') required String question,
  }) = _WordSelectionExerciseDto;

  factory WordSelectionExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$WordSelectionExerciseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  WordSelectionExercise get toDomain {
    return WordSelectionExercise(
      id: id,
      choices: choices,
      question: question,
      answer: answer,
    );
  }
}
