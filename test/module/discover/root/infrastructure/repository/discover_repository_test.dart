import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/root/infrastructure/repository/discover_repository.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late DiscoverRepository repository;
  late MockDiscoverRemoteDataSource mockDiscoverRemoteDataSource;

  setUp(() {
    mockDiscoverRemoteDataSource = MockDiscoverRemoteDataSource();
    repository = DiscoverRepository(
      remoteDataSource: mockDiscoverRemoteDataSource,
    );
  });

  group('Discover Repository Test', () {
    test('should return list of Thing when remoteDataSource succeeds', () async {
      final mockThings = [
        const Thing(
          id: '1',
          name: 'maudo',
          examples: [
            CharacterExample(
              title: 'maudo1',
              image: 'maudo1.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
            CharacterExample(
              title: 'maudo2',
              image: 'maudo2.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
          ],
          order: 1,
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          type: ThingType.color,
          image: 'maudo.png',
          exercises: [],
          totalExercises: 2,
        ),
        const Thing(
          id: '2',
          name: 'mauxanh',
          examples: [
            CharacterExample(
              title: 'mauxanh1',
              image: 'mauxanh1.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
            CharacterExample(
              title: 'mauxanh2',
              image: 'mauxanh2.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
          ],
          order: 2,
          audio:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          type: ThingType.color,
          image: 'mauxanh.png',
          exercises: [],
          totalExercises: 2,
        ),
      ];

      when(
        () => mockDiscoverRemoteDataSource.getThings(),
      ).thenAnswer((_) async => mockThings);

      // Act
      final result = await repository.getThings();

      // Assert
      expect(result, Right(mockThings));
      verify(() => mockDiscoverRemoteDataSource.getThings()).called(1);
      verifyNoMoreInteractions(mockDiscoverRemoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => mockDiscoverRemoteDataSource.getThings(),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getThings();

        // Assert
        expect(result, isA<Left<AppFailure, List<Thing>>>());
        verify(() => mockDiscoverRemoteDataSource.getThings()).called(1);
      },
    );
  });

  test(
    'should return list of UserProgress when getUserProgress succeeds',
    () async {
      // Arrange
      const userId = 'user_123';
      final mockProgressList = [
        UserProgress(
          id: '1',
          exerciseType: ExerciseType.things,
          writeAt: DateTime.now(),
          exercises: [],
        ),
        UserProgress(
          id: '2',
          exerciseType: ExerciseType.things,
          writeAt: DateTime.now(),
          exercises: const [],
        ),
      ];

      when(
        () => mockDiscoverRemoteDataSource.getUserProgress(userId: userId),
      ).thenAnswer((_) async => mockProgressList);

      // Act
      final result = await repository.getUserProgress(userId: userId);

      // Assert
      expect(result, Right(mockProgressList));
      verify(
        () => mockDiscoverRemoteDataSource.getUserProgress(userId: userId),
      ).called(1);
      verifyNoMoreInteractions(mockDiscoverRemoteDataSource);
    },
  );
  test(
    'should return AppFailure when getUserProgress throws an exception',
    () async {
      // Arrange
      const userId = 'user_123';

      when(
        () => mockDiscoverRemoteDataSource.getUserProgress(userId: userId),
      ).thenThrow(Exception());

      // Act
      final result = await repository.getUserProgress(userId: userId);

      // Assert
      expect(result, isA<Left<AppFailure, List<UserProgress>>>());
      verify(
        () => mockDiscoverRemoteDataSource.getUserProgress(userId: userId),
      ).called(1);
      verifyNoMoreInteractions(mockDiscoverRemoteDataSource);
    },
  );
}
