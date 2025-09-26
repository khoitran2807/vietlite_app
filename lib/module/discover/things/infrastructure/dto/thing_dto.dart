import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'thing_dto.freezed.dart';

part 'thing_dto.g.dart';

@freezed
class ThingDto with _$ThingDto {
  const ThingDto._();

  const factory ThingDto({
    required String id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String audio,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(defaultValue: []) required List<ThingExampleDto> examples,
    @JsonKey(defaultValue: 0) required int order,
    @JsonKey(defaultValue: '') required String type,
    @JsonKey(defaultValue: []) required List<ThingExerciseDto> exercises,
    @JsonKey(defaultValue: 0) required int totalExercises,
    @JsonKey(defaultValue: false) required bool isPremium,
  }) = _ThingDto;

  factory ThingDto.fromJson(Map<String, dynamic> json) =>
      _$ThingDtoFromJson(json);

  Thing get toDomain {
    return Thing(
      id: id,
      name: name,
      order: order,
      image: image,
      type: ThingType.values.firstWhere(
        (e) => e.name == type,
        orElse: () => ThingType.color,
      ),
      audio: audio,
      examples: examples.map((item) => item.toDomain).toList(),
      exercises: exercises.map((e) => e.toDomain).toList(),
      totalExercises: totalExercises,
      isPremium: isPremium,
    );
  }
}

@freezed
class ThingExampleDto with _$ThingExampleDto {
  const ThingExampleDto._();

  const factory ThingExampleDto({
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(defaultValue: '') required String audio,
  }) = _ThingExampleDto;

  factory ThingExampleDto.fromJson(Map<String, dynamic> json) =>
      _$ThingExampleDtoFromJson(json);

  CharacterExample get toDomain {
    return CharacterExample(title: title, image: image, audio: audio);
  }
}

@freezed
class ThingExerciseDto with _$ThingExerciseDto {
  const ThingExerciseDto._();

  const factory ThingExerciseDto({
    required String id,
    @JsonKey(defaultValue: '') required String answer,
    @JsonKey(defaultValue: <String>[]) required List<String> choices,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(defaultValue: '') required String question,
  }) = _ThingExerciseDto;

  factory ThingExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ThingExerciseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  ThingExercise get toDomain {
    return ThingExercise(
      id: id,
      choices: choices,
      answer: answer,
      image: image,
      question: question,
    );
  }
}
