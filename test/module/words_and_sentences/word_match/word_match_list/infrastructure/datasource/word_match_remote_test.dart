import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/datasource/word_match_remote.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordMatchRemoteDataSource wordMatchRemoteDataSource;
  late MockFirestoreService mockFirestoreService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    wordMatchRemoteDataSource = WordMatchRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('getWordMatches', () {
    test('should return a list of WordMatch from Firestore', () async {
      // Arrange
      final wordMatchesMap = [
        {'id': '1', 'title': 'Word 1', 'exercises': [], 'order': 1},
        {'id': '2', 'title': 'Word 2', 'exercises': [], 'order': 2},
      ];
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordMatches',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => wordMatchesMap);

      // Act
      final result = await wordMatchRemoteDataSource.getWordMatches();

      // Assert
      expect(result, isA<List<WordMatch>>());
      expect(result.length, 2);
      expect(result[0].title, 'Word 1');
      expect(result[1].title, 'Word 2');

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordMatches',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should return empty list when no data is available', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordMatches',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await wordMatchRemoteDataSource.getWordMatches();

      // Assert
      expect(result, isA<List<WordMatch>>());
      expect(result.isEmpty, true);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordMatches',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordMatches',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenThrow(Exception('Failed to fetch data'));

      // Act & Assert
      expect(
        () async => await wordMatchRemoteDataSource.getWordMatches(),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getUserProgresss', () {
    const String userId = '123';

    test('should return a list of UserProgress from Firestore', () async {
      // Arrange
      final userProgressMap = [
        {'id': '1', 'progress': 'Completed', 'exercises': []},
        {'id': '2', 'progress': 'In Progress', 'exercises': []},
      ];
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        ),
      ).thenAnswer((_) async => userProgressMap);

      // Act
      final result = await wordMatchRemoteDataSource.getUserProgress(
        userId: userId,
      );

      // Assert
      expect(result, isA<List<UserProgress>>());
      expect(result.length, 2);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        ),
      ).called(1);
    });

    test('should return empty list when no data is available', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await wordMatchRemoteDataSource.getUserProgress(
        userId: userId,
      );

      // Assert
      expect(result, isA<List<UserProgress>>());
      expect(result.isEmpty, true);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        ),
      ).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          filterKey: 'exerciseType',
          filterValue: ExerciseType.wordMatch.name,
        ),
      ).thenThrow(Exception('Failed to fetch user progress'));

      // Act & Assert
      expect(
        () async =>
            await wordMatchRemoteDataSource.getUserProgress(userId: userId),
        throwsA(isA<Exception>()),
      );
    });
  });
}
