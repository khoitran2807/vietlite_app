import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/util/helper.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'letter_dto.freezed.dart';

part 'letter_dto.g.dart';

@freezed
class LetterDto with _$LetterDto {
  const LetterDto._();

  const factory LetterDto({
    required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String audioTitle,
    @JsonKey(defaultValue: 0) required int order,
    @JsonKey(readValue: handleNullableMapKey)
    required LetterExampleDto mainExample,
    @JsonKey(readValue: handleNullableMapKey) required LetterSpellDto spell,
    @JsonKey(defaultValue: []) required List<LetterExampleDto> examples,
  }) = _LetterDto;

  factory LetterDto.fromJson(Map<String, dynamic> json) =>
      _$LetterDtoFromJson(json);

  Letter get toDomain {
    return Letter(
      id: id,
      title: title,
      audioTitle: audioTitle,
      order: order,
      mainExample: mainExample.toDomain,
      spell: spell.toDomain,
      examples: examples.map((item) => item.toDomain).toList(),
    );
  }
}

@freezed
class LetterExampleDto with _$LetterExampleDto {
  const LetterExampleDto._();

  const factory LetterExampleDto({
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(defaultValue: '') required String audio,
  }) = _LetterExampleDto;

  factory LetterExampleDto.fromJson(Map<String, dynamic> json) =>
      _$LetterExampleDtoFromJson(json);

  CharacterExample get toDomain {
    return CharacterExample(title: title, image: image, audio: audio);
  }
}

@freezed
class LetterSpellDto with _$LetterSpellDto {
  const LetterSpellDto._();

  const factory LetterSpellDto({
    @JsonKey(defaultValue: <String>[]) required List<String> spells,
    @JsonKey(defaultValue: <String>[]) required List<String> accents,
    @JsonKey(defaultValue: '') required String audioSpell,
    @JsonKey(defaultValue: '') required String audioAccent,
  }) = _LetterSpellDto;

  factory LetterSpellDto.fromJson(Map<String, dynamic> json) =>
      _$LetterSpellDtoFromJson(json);

  LetterSpell get toDomain {
    return LetterSpell(
      spells: spells,
      audioSpell: audioSpell,
      accents: accents,
      audioAccent: audioAccent,
    );
  }
}
