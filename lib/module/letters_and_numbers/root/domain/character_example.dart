import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_example.freezed.dart';

@freezed
class CharacterExample with _$CharacterExample {
  const CharacterExample._();

  const factory CharacterExample({
    required String title,
    required String image,
    required String audio,
  }) = _CharacterExample;

  factory CharacterExample.empty() =>
      const CharacterExample(title: '', image: '', audio: '');
}
