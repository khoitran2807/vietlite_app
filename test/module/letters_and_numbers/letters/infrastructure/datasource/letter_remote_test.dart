import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/datasource/letter_remote.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/dto/letter_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late LetterRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = LetterRemoteDataSource(firestoreService: mockFirestoreService);
  });

  group('LetterRemoteDataSource Tests', () {
    test('getLetters should return a list of Letter', () async {
      // Arrange
      final mockData = [
        {
          'id': '1',
          'order': 1,
          'title': 'A',
          'mainExample': {
            'title': 'Apple',
            'image': 'apple.png',
            'audio': 'audio_url',
          },
          'examples': [
            {'title': 'apple', 'image': 'avatar1.png', 'audio': 'audio_url'},
            {'title': 'vvv', 'image': 'image1.png', 'audio': 'audio_url'},
          ],
        },
        {
          'id': '2',
          'title': 'B',
          'order': 2,
          'mainExample': {
            'title': 'Boil',
            'image': 'boil.png',
            'audio': 'audio_url',
          },
          'examples': [
            {'title': 'Banana', 'image': 'avatar.png', 'audio': 'audio_url'},
            {'title': 'Ball', 'image': 'image.png', 'audio': 'audio_url'},
          ],
        },
      ];

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'letters',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => mockData);

      final expectedLetters =
          mockData.map((e) => LetterDto.fromJson(e).toDomain).toList();

      // Act
      final result = await dataSource.getLetters();

      // Assert
      expect(result, equals(expectedLetters));
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'letters',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should return an empty list when no data is found', () async {
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'letters',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => []);

      final result = await dataSource.getLetters();

      expect(result, isEmpty);
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'letters',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should handle missing fields in JSON gracefully', () {
      final json = {
        'id': '1', // title is missing
      };

      final dto = LetterDto.fromJson(json);

      expect(dto.id, '1');
      expect(dto.title, ''); // Should default to empty string
      expect(dto.spell.accents, isEmpty); // Should default to empty list
      expect(dto.examples, isEmpty); // Should default to empty list
    });

    test('should serialize LetterExampleDto correctly', () {
      const example = LetterExampleDto(
        title: 'apple',
        image: 'apple.png',
        audio: 'audio_url',
      );

      final json = example.toJson();

      expect(json, {
        'title': 'apple',
        'image': 'apple.png',
        'audio': 'audio_url',
      });
    });

    test('should serialize LetterDto correctly', () {
      const examples = [
        LetterExampleDto(
          title: 'apple',
          image: 'apple.png',
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
        LetterExampleDto(
          title: 'ant',
          image: 'ant.png',
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
      ];
      const spell = LetterSpellDto(
        spells: ['u', 'yên', 'uyên'],
        accents: ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
        audioSpell:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        audioAccent:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );
      const mainExample = LetterExampleDto(
        title: 'Apple',
        image: 'apple.png',
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );
      const dto = LetterDto(
        id: '1',
        title: 'A',
        mainExample: mainExample,
        spell: spell,
        examples: examples,
        audioTitle:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        order: 1,
      );

      final json = dto.toJson();

      expect(json, {
        'id': '1',
        'order': 1,
        'title': 'A',
        'mainExample': mainExample,
        'spell': spell,
        'examples': examples,
        'audioTitle':
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      });
    });

    test('should serialize LetterSpellDto correctly', () {
      const spellDto = LetterSpellDto(
        spells: ['u', 'yên', 'uyên'],
        accents: ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
        audioSpell:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        audioAccent:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );

      final json = spellDto.toJson();

      expect(json, {
        'audioSpell':
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        'audioAccent':
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        'spells': ['u', 'yên', 'uyên'],
        'accents': ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
      });
    });
    test('should parse valid spells and accents correctly', () {
      final jsonWithValidSpellsAndAccents = {
        'audioSpell': 'https://example.com/audioSpell.mp3',
        'audioAccent': 'https://example.com/audioAccent.mp3',
        'spells': ['a', 'b', 'c'],
        'accents': ['Á', 'À', 'Ả'],
      };

      final spellDto = LetterSpellDto.fromJson(jsonWithValidSpellsAndAccents);

      expect(spellDto.spells, equals(['a', 'b', 'c']));
      expect(spellDto.accents, equals(['Á', 'À', 'Ả']));
    });
  });
}
