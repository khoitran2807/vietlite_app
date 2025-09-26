import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'letter.freezed.dart';

@freezed
class Letter with _$Letter {
  const Letter._();

  const factory Letter({
    required String id,
    required String title,
    required int order,
    required String audioTitle,
    required LetterSpell spell,
    required CharacterExample mainExample,
    required List<CharacterExample> examples,
  }) = _Letter;

  factory Letter.empty() => Letter(
    id: '',
    title: '',
    order: 0,
    audioTitle: '',
    mainExample: CharacterExample.empty(),
    spell: LetterSpell.empty(),
    examples: [],
  );
}

@freezed
class LetterSpell with _$LetterSpell {
  const LetterSpell._();

  const factory LetterSpell({
    required List<String> accents,
    required String audioAccent,
    required List<String> spells,
    required String audioSpell,
  }) = _LetterSpell;

  factory LetterSpell.empty() => const LetterSpell(
    accents: [],
    audioAccent: '',
    spells: [],
    audioSpell: '',
  );
}
