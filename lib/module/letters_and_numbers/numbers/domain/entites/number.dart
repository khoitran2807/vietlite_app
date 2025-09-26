import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'number.freezed.dart';

@freezed
class Number with _$Number {
  const Number._();

  const factory Number({
    required String id,
    required String title,
    required String textTitle,
    required String audio,
    required NumberSpell spell,
    required NumberCount count,
    required List<CharacterExample> examples,
  }) = _Number;

  String get audioUrl {
    final count = int.tryParse(title);
    if (count == null || count <= 0) return '';
    return 'audios/$count.wav';
  }

  List<NumberCount> get counts {
    final titleCount = int.tryParse(title);
    if (titleCount == null || titleCount <= 0) return [];
    return List.generate(
      titleCount,
      (index) => NumberCount(colored: count.colored, noColor: count.noColor),
    );
  }

  factory Number.empty() => const Number(
    id: '',
    title: '',
    textTitle: '',
    audio: '',
    spell: NumberSpell(audio: '', details: []),
    count: NumberCount(colored: '', noColor: ''),
    examples: [],
  );
}

@freezed
class NumberSpell with _$NumberSpell {
  const NumberSpell._();

  const factory NumberSpell({
    required String audio,
    required List<String> details,
  }) = _NumberSpell;
}

@freezed
class NumberCount with _$NumberCount {
  const NumberCount._();

  const factory NumberCount({
    required String noColor,
    required String colored,
  }) = _NumberCount;
}
