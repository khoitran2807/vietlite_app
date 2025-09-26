import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/dto/number_dto.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

void main() {
  group('Number Model Tests', () {
    test('should create a valid Number instance', () {
      const number = Number(
        id: '1',
        title: 'One',
        textTitle: 'Một',
        audio: 'https://google.com.vn',
        spell: NumberSpell(
          audio: 'https://google.com.vn',
          details: ['m', 'ột', 'một'],
        ),
        examples: [
          CharacterExample(
            title: '1',
            image: 'https://example.com/image1.jpg',
            audio: 'https://example.com/audio1.mp3',
          ),
          CharacterExample(
            title: '1',
            image: 'https://example.com/image2.jpg',
            audio: 'https://example.com/audio2.mp3',
          ),
        ],
        count: NumberCount(noColor: 'noColor', colored: 'colored'),
      );

      expect(number.id, '1');
      expect(number.title, 'One');
      expect(number.textTitle, 'Một');
      expect(number.audio, 'https://google.com.vn');
      expect(number.spell.audio, 'https://google.com.vn');
      expect(number.spell.details, ['m', 'ột', 'một']);
      expect(number.examples.length, 2);
      expect(number.examples.first.title, '1');
      expect(number.examples.first.image, 'https://example.com/image1.jpg');
      expect(number.examples.first.audio, 'https://example.com/audio1.mp3');
    });

    test('should create an empty Number instance', () {
      final number = Number.empty();

      expect(number.id, '');
      expect(number.title, '');
      expect(number.textTitle, '');
      expect(number.audio, '');
      expect(number.spell.audio, '');
      expect(number.spell.details, []);
      expect(number.examples, []);
    });
  });

  group('NumberSpell Model Tests', () {
    test('should create a valid NumberSpell instance', () {
      const spell = NumberSpell(
        audio: 'https://google.com.vn',
        details: ['m', 'ột', 'một'],
      );

      expect(spell.audio, 'https://google.com.vn');
      expect(spell.details, ['m', 'ột', 'một']);
    });
  });

  group('NumberExample Model Tests', () {
    test('should create a valid NumberExample instance', () {
      const example = CharacterExample(
        title: '1',
        image: 'https://example.com/image1.jpg',
        audio: 'https://example.com/audio1.mp3',
      );

      expect(example.title, '1');
      expect(example.image, 'https://example.com/image1.jpg');
      expect(example.audio, 'https://example.com/audio1.mp3');
    });
  });
  group('Number getters', () {
    test(
      'audioUrl should return empty string if title is not a positive number',
      () {
        const number1 = Number(
          id: '1',
          title: 'abc', // không phải số
          textTitle: '',
          audio: '',
          spell: NumberSpell(audio: '', details: []),
          count: NumberCount(noColor: 'noColor', colored: 'colored'),
          examples: [],
        );

        const number2 = Number(
          id: '2',
          title: '0', // số không hợp lệ
          textTitle: '',
          audio: '',
          spell: NumberSpell(audio: '', details: []),
          count: NumberCount(noColor: 'noColor', colored: 'colored'),
          examples: [],
        );

        expect(number1.audioUrl, '');
        expect(number2.audioUrl, '');
      },
    );

    test('audioUrl should return correct url when title is a valid number', () {
      const number = Number(
        id: '3',
        title: '5',
        textTitle: '',
        audio: '',
        spell: NumberSpell(audio: '', details: []),
        count: NumberCount(noColor: 'noColor', colored: 'colored'),
        examples: [],
      );

      expect(number.audioUrl, 'audios/5.wav');
    });

    test(
      'counts should return empty list if title is not a positive number',
      () {
        const number = Number(
          id: '1',
          title: '-1',
          textTitle: '',
          audio: '',
          spell: NumberSpell(audio: '', details: []),
          count: NumberCount(noColor: 'noColor', colored: 'colored'),
          examples: [],
        );

        expect(number.counts, isEmpty);
      },
    );

    test('counts should return correct list when title is a valid number', () {
      const number = Number(
        id: '1',
        title: '3',
        textTitle: '',
        audio: '',
        spell: NumberSpell(audio: '', details: []),
        count: NumberCount(noColor: 'noColor', colored: 'colored'),
        examples: [],
      );

      final counts = number.counts;
      expect(counts.length, 3);
      expect(counts[0].colored, 'colored');
      expect(counts[0].noColor, 'noColor');
    });
  });
  group('NumberCountDto JSON tests', () {
    test('toJson should return correct map', () {
      const dto = NumberCountDto(noColor: 'gray', colored: 'red');

      final json = dto.toJson();

      expect(json, {'noColor': 'gray', 'colored': 'red'});
    });

    test('fromJson should create correct NumberCountDto instance', () {
      final json = {'noColor': 'blue', 'colored': 'green'};

      final dto = NumberCountDto.fromJson(json);

      expect(dto.noColor, 'blue');
      expect(dto.colored, 'green');
    });
  });
}
