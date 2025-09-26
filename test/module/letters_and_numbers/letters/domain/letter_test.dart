import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

void main() {
  group('Letter Entity', () {
    test('should create a valid Letter instance', () {
      const letter = Letter(
        id: '1',
        title: 'A',
        mainExample: CharacterExample(
          title: 'Apple',
          image: 'apple.png',
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
        spell: LetterSpell(
          accents: ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
          audioAccent:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          spells: ['u', 'yên', 'uyên'],
          audioSpell:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
        examples: [
          CharacterExample(
            title: 'Ant',
            image: 'ant.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          CharacterExample(
            title: 'Airplane',
            image: 'airplane.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
        ],
        audioTitle:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        order: 1,
      );

      expect(letter.id, '1');
      expect(letter.order, 1);
      expect(letter.title, 'A');
      expect(letter.mainExample.title, 'Apple');
      expect(letter.spell.accents, ['À', 'Á', 'Ả', 'Ã', 'Ạ']);
      expect(letter.examples.length, 2);
      expect(letter.examples.first.title, 'Ant');
      expect(letter.examples.first.image, 'ant.png');
    });

    test(
      'LetterExample empty factory should return an object with default values',
      () {
        final example = CharacterExample.empty();
        expect(example.title, '');
        expect(example.image, '');
        expect(example.audio, '');
      },
    );

    test(
      'LetterSpell empty factory should return an object with default values',
      () {
        final spell = LetterSpell.empty();
        expect(spell.accents, isEmpty);
        expect(spell.audioAccent, '');
        expect(spell.spells, isEmpty);
        expect(spell.audioSpell, '');
      },
    );

    test(
      'Letter empty factory should return an object with default values',
      () {
        final letter = Letter.empty();
        expect(letter.id, '');
        expect(letter.title, '');
        expect(letter.mainExample, isA<CharacterExample>());
        expect(letter.spell, isA<LetterSpell>());
        expect(letter.examples, isEmpty);
      },
    );
  });

  group('LetterExample Entity', () {
    test('should create a valid LetterExample instance', () {
      const example = CharacterExample(
        title: 'Bird',
        image: 'bird.png',
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );

      expect(example.title, 'Bird');
      expect(example.image, 'bird.png');
      expect(
        example.audio,
        'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );
    });
  });
}
