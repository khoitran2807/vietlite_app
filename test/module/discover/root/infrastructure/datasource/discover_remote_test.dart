import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/discover/root/infrastructure/datasource/discover_remote.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late DiscoverRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = DiscoverRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('DiscoverRemoteDataSource Tests', () {
    test('getThings should return a list of Thing', () async {
      // Arrange
      final mockData = [
        {
          'id': '1',
          'order': 1,
          'title': 'maudo',
          'type': 'color',
          'examples': [
            {'title': 'maudo1', 'image': 'maudo1.png', 'audio': 'audio_url'},
            {'title': 'maudo2', 'image': 'maudo2.png', 'audio': 'audio_url'},
          ],
          'audio':
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        },
        {
          'id': '2',
          'order': 2,
          'title': 'mauxanh',
          'type': 'color',
          'examples': [
            {
              'title': 'mauxanh1',
              'image': 'mauxanh1.png',
              'audio': 'audio_url',
            },
            {
              'title': 'mauxanh2',
              'image': 'mauxanh2.png',
              'audio': 'audio_url',
            },
          ],
          'audio':
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        },
      ];

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => mockData);

      final expectedThings =
          mockData.map((e) => ThingDto.fromJson(e).toDomain).toList();

      // Act
      final result = await dataSource.getThings();

      // Assert
      expect(result, equals(expectedThings));
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should return an empty list when no data is found', () async {
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => []);

      final result = await dataSource.getThings();

      expect(result, isEmpty);
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should handle missing fields in JSON gracefully', () {
      final json = {
        'id': '1', // title is missing
      };

      final dto = ThingDto.fromJson(json);

      expect(dto.id, '1');
      expect(dto.name, ''); // Should default to empty string
      expect(dto.audio, '');
      expect(dto.examples, isEmpty); // Should default to empty list
    });

    test('should serialize ThingExampleDto correctly', () {
      const example = ThingExampleDto(
        title: 'maudo1',
        image: 'maudo1.png',
        audio: 'audio_url',
      );

      final json = example.toJson();

      expect(json, {
        'title': 'maudo1',
        'image': 'maudo1.png',
        'audio': 'audio_url',
      });
    });

    test('should serialize ThingDto correctly', () {
      const examples = [
        ThingExampleDto(
          title: 'maudo1',
          image: 'maudo1.png',
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
        ThingExampleDto(
          title: 'maudo2',
          image: 'maudo2.png',
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        ),
      ];
      const dto = ThingDto(
        id: '1',
        name: 'maudo1',
        examples: examples,
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        order: 1,
        type: 'color',
        image: 'maudo.png',
        exercises: [],
        totalExercises: 2,
      );

      final json = dto.toJson();

      expect(json, {
        'id': '1',
        'order': 1,
        'name': 'maudo1',
        'type': 'color',
        'examples': examples,
        'audio':
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        'totalExercises': 2,
        'isPremium': false,
        'image': 'maudo.png',
        'exercises': [],
      });
    });
  });

  test('getUserProgress returns list of UserProgress correctly', () async {
    const userId = 'testUser';
    final mockProgressList = [
      {
        'id': '1',
        'exerciseType': 'things',
        'writeAt': '2024-07-01T00:00:00.000',
        'exercises': [
          {'id': 'ex1'},
        ],
      },
      {
        'id': '2',
        'exerciseType': 'things',
        'writeAt': '2024-06-01T00:00:00.000',
        'exercises': [],
      },
    ];

    when(
      () => mockFirestoreService.getDocumentsInCollection(
        collection: 'users/$userId/progress',
        filterKey: 'exerciseType',
        filterValue: ExerciseType.things.name,
        orderBy: 'writeAt',
        descending: true,
      ),
    ).thenAnswer((_) async => mockProgressList);

    final result = await dataSource.getUserProgress(userId: userId);

    expect(result.length, 2);
    expect(result.first.id, '1');
    expect(result.first.exerciseType, ExerciseType.things);
    expect(result.first.exercises.length, 1);
  });

  test('getUserProgress returns empty list when no data found', () async {
    const userId = 'emptyUser';

    when(
      () => mockFirestoreService.getDocumentsInCollection(
        collection: 'users/$userId/progress',
        filterKey: 'exerciseType',
        filterValue: ExerciseType.things.name,
        orderBy: 'writeAt',
        descending: true,
      ),
    ).thenAnswer((_) async => []);

    final result = await dataSource.getUserProgress(userId: userId);

    expect(result, isEmpty);
  });

  test(
    'getUserProgress calls firestoreService with correct parameters',
    () async {
      const userId = 'verifyUser';

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: any(named: 'collection'),
          filterKey: any(named: 'filterKey'),
          filterValue: any(named: 'filterValue'),
          orderBy: any(named: 'orderBy'),
          descending: any(named: 'descending'),
        ),
      ).thenAnswer((_) async => []);

      await dataSource.getUserProgress(userId: userId);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.things.name,
          orderBy: 'writeAt',
          descending: true,
        ),
      ).called(1);
    },
  );
}
