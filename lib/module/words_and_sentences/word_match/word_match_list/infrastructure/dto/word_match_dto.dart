import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
part 'word_match_dto.freezed.dart';

part 'word_match_dto.g.dart';

@freezed
class WordMatchDto with _$WordMatchDto {
  const WordMatchDto._();

  const factory WordMatchDto({
    required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: 0) required int order,
    @JsonKey(defaultValue: 0) required int totalExercises,
    @JsonKey(defaultValue: []) required List<WordMatchExerciseDto> exercises,
    @JsonKey(defaultValue: false) required bool isPremium,
  }) = _WordMatchDto;

  factory WordMatchDto.fromJson(Map<String, dynamic> json) =>
      _$WordMatchDtoFromJson(json);

  /// Convert DTO to Domain Entity
  WordMatch get toDomain {
    return WordMatch(
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
class WordMatchExerciseDto with _$WordMatchExerciseDto {
  const WordMatchExerciseDto._();

  const factory WordMatchExerciseDto({
    required String id,
    @JsonKey(defaultValue: '') required String answer,
    @JsonKey(defaultValue: <String>[]) required List<String> choices,
    @JsonKey(defaultValue: '') required String image,
  }) = _WordMatchExerciseDto;

  factory WordMatchExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$WordMatchExerciseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  WordMatchExercise get toDomain {
    return WordMatchExercise(
      id: id,
      choices: choices,
      answer: answer,
      image: image,
    );
  }
}
