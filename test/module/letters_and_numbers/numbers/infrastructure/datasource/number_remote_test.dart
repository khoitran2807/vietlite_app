import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/datasource/number_remote.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/dto/number_dto.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late NumberRemoteDataSource dataSource;
  late MockFirestoreService mockFirestoreService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = NumberRemoteDataSource(firestoreService: mockFirestoreService);
  });

  group('getNumbers', () {
    test(
      'should return a list of Numbers when FirestoreService returns data',
      () async {
        // Arrange: Fake Firestore response
        final fakeFirestoreData = [
          {
            "id": "1",
            "title": "One",
            "textTitle": "Một",
            "audio": "https://google.com.vn",
            "spell": {
              "audio": "https://google.com.vn",
              "details": ["m", "ột", "một"],
            },
            "examples": [
              {
                "title": "1 cái bút",
                "image": "https://example.com/image1.jpg",
                "audio": "https://example.com/audio1.mp3",
              },
            ],
          },
        ];

        when(
          () => mockFirestoreService.getDocumentsInCollection(
            collection: 'numbers',
            orderBy: any(named: 'orderBy'),
          ),
        ).thenAnswer((_) async => fakeFirestoreData);

        // Act
        final result = await dataSource.getNumbers();

        // Assert
        expect(result, isA<List<Number>>());
        expect(result.length, 1);
        expect(result.first.id, "1");
        expect(result.first.title, "One");
        expect(result.first.textTitle, "Một");
        expect(result.first.audio, "https://google.com.vn");
        expect(result.first.spell.audio, "https://google.com.vn");
        expect(result.first.spell.details, ["m", "ột", "một"]);
        expect(result.first.examples.length, 1);
        expect(result.first.examples.first.title, "1 cái bút");
        expect(
          result.first.examples.first.image,
          "https://example.com/image1.jpg",
        );
        expect(
          result.first.examples.first.audio,
          "https://example.com/audio1.mp3",
        );

        verify(
          () => mockFirestoreService.getDocumentsInCollection(
            collection: 'numbers',
            orderBy: 'title',
          ),
        ).called(1);
      },
    );

    test(
      'should return an empty list when FirestoreService returns empty data',
      () async {
        // Arrange: Empty Firestore response
        when(
          () => mockFirestoreService.getDocumentsInCollection(
            collection: 'numbers',
            orderBy: any(named: 'orderBy'),
          ),
        ).thenAnswer((_) async => []);

        // Act
        final result = await dataSource.getNumbers();

        // Assert
        expect(result, isA<List<Number>>());
        expect(result.isEmpty, true);

        verify(
          () => mockFirestoreService.getDocumentsInCollection(
            collection: 'numbers',
            orderBy: 'title',
          ),
        ).called(1);
      },
    );

    test('should serialize NumberExampleDto correctly', () {
      const example = NumberExampleDto(
        title: 'apple',
        image: 'apple.png',
        audio: 'https://google.com.vn',
      );

      final json = example.toJson();

      expect(json, {
        'title': 'apple',
        'image': 'apple.png',
        'audio': 'https://google.com.vn',
      });
    });

    test('should serialize NumberDto correctly', () {
      const examples = [
        NumberExampleDto(
          title: 'apple',
          image: 'apple.png',
          audio: 'https://google.com.vn',
        ),
        NumberExampleDto(
          title: 'ant',
          image: 'ant.png',
          audio: 'https://google.com.vn',
        ),
      ];
      const spell = NumberSpellDto(
        audio: 'https://google.com.vn',
        details: ["m", "ột", "một"],
      );
      const count = NumberCountDto(noColor: 'noColor', colored: 'colored');
      const dto = NumberDto(
        id: '1',
        title: 'A',
        examples: examples,
        textTitle: 'Một',
        audio: 'https://google.com.vn',
        spell: spell,
        count: count,
      );

      final json = dto.toJson();

      expect(json, {
        'id': '1',
        'title': 'A',
        'textTitle': 'Một',
        'examples': examples,
        'audio': 'https://google.com.vn',
        'spell': spell,
        'count': count,
      });
    });

    test('should serialize NumberSpellDto correctly', () {
      const spell = NumberSpellDto(
        audio: 'https://google.com.vn',
        details: ["m", "ột", "một"],
      );

      final json = spell.toJson();

      expect(json, {
        'audio': 'https://google.com.vn',
        'details': ["m", "ột", "một"],
      });
    });

    test('should handle missing details field in JSON', () {
      final json = {'audio': 'https://example.com/audio.mp3'};

      final spell = NumberSpellDto.fromJson(json);

      expect(spell.audio, 'https://example.com/audio.mp3');
      expect(spell.details, isEmpty);
    });

    test('should handle missing fields in JSON gracefully', () {
      final json = {
        'id': '1', // title is missing
      };

      final dto = NumberDto.fromJson(json);

      expect(dto.id, '1');
      expect(dto.title, ''); // Should default to empty string
      expect(dto.examples, isEmpty); // Should default to empty list
    });
  });
}
