import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/datasource/word_selection_remote.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordSelectionRemoteDataSource wordSelectionRemoteDataSource;
  late MockFirestoreService mockFirestoreService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    wordSelectionRemoteDataSource = WordSelectionRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('getWordSelections', () {
    test('should return a list of WordSelection from Firestore', () async {
      // Arrange
      final wordSelectionsMap = [
        {'id': '1', 'title': 'Word 1', 'exercises': [], 'order': 1},
        {'id': '2', 'title': 'Word 2', 'exercises': [], 'order': 2},
      ];
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => wordSelectionsMap);

      // Act
      final result = await wordSelectionRemoteDataSource.getWordSelections();

      // Assert
      expect(result, isA<List<WordSelection>>());
      expect(result.length, 2);
      expect(result[0].title, 'Word 1');
      expect(result[1].title, 'Word 2');

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should return empty list when no data is available', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await wordSelectionRemoteDataSource.getWordSelections();

      // Assert
      expect(result, isA<List<WordSelection>>());
      expect(result.isEmpty, true);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: 'order',
        ),
      ).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'wordSelections',
          orderBy: any(named: 'orderBy'),
        ),
      ).thenThrow(Exception('Failed to fetch data'));

      // Act & Assert
      expect(
        () async => await wordSelectionRemoteDataSource.getWordSelections(),
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
          filterValue: ExerciseType.wordSelection.name,
        ),
      ).thenAnswer((_) async => userProgressMap);

      // Act
      final result = await wordSelectionRemoteDataSource.getUserProgress(
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
          filterValue: ExerciseType.wordSelection.name,
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
          filterValue: ExerciseType.wordSelection.name,
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await wordSelectionRemoteDataSource.getUserProgress(
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
          filterValue: ExerciseType.wordSelection.name,
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
          filterValue: ExerciseType.wordSelection.name,
        ),
      ).thenThrow(Exception('Failed to fetch user progress'));

      // Act & Assert
      expect(
        () async =>
            await wordSelectionRemoteDataSource.getUserProgress(userId: userId),
        throwsA(isA<Exception>()),
      );
    });
  });
}
