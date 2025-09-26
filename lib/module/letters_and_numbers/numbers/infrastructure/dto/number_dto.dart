import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/util/helper.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'number_dto.freezed.dart';

part 'number_dto.g.dart';

@freezed
class NumberDto with _$NumberDto {
  const NumberDto._();

  const factory NumberDto({
    required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String textTitle,
    @JsonKey(defaultValue: '') required String audio,
    @JsonKey(defaultValue: []) required List<NumberExampleDto> examples,
    @JsonKey(readValue: handleNullableMapKey) required NumberSpellDto spell,
    @JsonKey(readValue: handleNullableMapKey) required NumberCountDto count,
  }) = _NumberDto;

  factory NumberDto.fromJson(Map<String, dynamic> json) =>
      _$NumberDtoFromJson(json);

  Number get toDomain {
    return Number(
      id: id,
      title: title,
      textTitle: textTitle,
      audio: audio,
      spell: spell.toDomain,
      count: count.toDomain,
      examples: examples.map((item) => item.toDomain).toList(),
    );
  }
}

@freezed
class NumberSpellDto with _$NumberSpellDto {
  const NumberSpellDto._();

  const factory NumberSpellDto({
    @JsonKey(defaultValue: '') required String audio,
    @JsonKey(defaultValue: <String>[]) required List<String> details,
  }) = _NumberSpellDto;

  factory NumberSpellDto.fromJson(Map<String, dynamic> json) =>
      _$NumberSpellDtoFromJson(json);

  NumberSpell get toDomain {
    return NumberSpell(audio: audio, details: details);
  }
}

@freezed
class NumberCountDto with _$NumberCountDto {
  const NumberCountDto._();

  const factory NumberCountDto({
    @JsonKey(defaultValue: '') required String noColor,
    @JsonKey(defaultValue: '') required String colored,
  }) = _NumberCountDto;

  factory NumberCountDto.fromJson(Map<String, dynamic> json) =>
      _$NumberCountDtoFromJson(json);

  NumberCount get toDomain {
    return NumberCount(colored: colored, noColor: noColor);
  }
}

@freezed
class NumberExampleDto with _$NumberExampleDto {
  const NumberExampleDto._();

  const factory NumberExampleDto({
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(defaultValue: '') required String audio,
  }) = _NumberExampleDto;

  factory NumberExampleDto.fromJson(Map<String, dynamic> json) =>
      _$NumberExampleDtoFromJson(json);

  CharacterExample get toDomain {
    return CharacterExample(title: title, image: image, audio: audio);
  }
}
