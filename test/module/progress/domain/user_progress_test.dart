import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';

class MockUserExercise extends Mock implements UserExercise {}

void main() {
  group('UserProgress Tests', () {
    test('should create a UserProgress instance with valid data', () {
      final progress = UserProgress(
        id: '123',
        exerciseType: ExerciseType.wordSelection,
        writeAt: DateTime(2023, 1, 1),
        exercises: [
          const UserExercise(id: '1', lastAnswer: 'answer', isCorrect: true),
          const UserExercise(id: '2', lastAnswer: 'question', isCorrect: true),
        ],
      );

      expect(progress.id, '123');
      expect(progress.exerciseType, ExerciseType.wordSelection);
      expect(progress.writeAt, DateTime(2023, 1, 1));
      expect(progress.exercises, isNotEmpty);
      expect(progress.exercises.length, 2);
      expect(progress.exercises.first.lastAnswer, 'answer');
      expect(progress.exercises.first.isCorrect, true);
      expect(progress.exercises.first.id, '1');
    });

    test('should create an empty UserProgress instance', () {
      final emptyProgress = UserProgress.empty();
      expect(emptyProgress.id, '');
      expect(emptyProgress.exerciseType, ExerciseType.other);
      expect(emptyProgress.exercises, []);
      expect(emptyProgress.writeAt, isNull);
    });

    test('should create an empty UserExercise instance', () {
      final emptyExercise = UserExercise.empty();
      expect(emptyExercise.id, '');
      expect(emptyExercise.lastAnswer, '');
      expect(emptyExercise.isCorrect, false);
    });
    test('should calculate completedExercises correctly', () {
      final progress = UserProgress(
        id: 'p1',
        exerciseType: ExerciseType.letter,
        writeAt: DateTime(2024, 1, 1),
        exercises: [
          const UserExercise(id: '1', lastAnswer: 'A', isCorrect: true),
          const UserExercise(id: '2', lastAnswer: 'B', isCorrect: false),
          const UserExercise(id: '3', lastAnswer: 'C', isCorrect: true),
        ],
      );

      expect(progress.completedExercises, 2);
    });

    test('should parse from JSON correctly', () {
      final jsonMap = {
        'id': '123',
        'exerciseType': 'wordSelection',
        'writeAt': '2024-07-01T00:00:00.000',
        'exercises': [
          {'id': 'ex1', 'lastAnswer': '10', 'isCorrect': true},
          {'id': 'ex2', 'lastAnswer': '5', 'isCorrect': false},
        ],
      };

      final progress = UserProgressDto.fromJson(jsonMap).toDomain;

      expect(progress.id, '123');
      expect(progress.exerciseType, ExerciseType.wordSelection);
      expect(progress.writeAt, DateTime(2024, 7, 1));
      expect(progress.exercises.length, 2);
    });

    test(
      'should handle empty or null exercises list when parsing from JSON',
      () {
        final jsonWithEmptyExercises = {
          'id': '123',
          'exerciseType': 'wordSelection',
          'writeAt': '2024-07-01T00:00:00.000',
          'exercises': [],
        };

        final jsonWithNullExercises = {
          'id': '123',
          'exerciseType': 'wordSelection',
          'writeAt': '2024-07-01T00:00:00.000',
          'exercises': null,
        };

        // Parsing JSON with empty exercises list
        final progressWithEmptyExercises =
            UserProgressDto.fromJson(jsonWithEmptyExercises).toDomain;
        expect(progressWithEmptyExercises.id, '123');
        expect(
          progressWithEmptyExercises.exerciseType,
          ExerciseType.wordSelection,
        );
        expect(progressWithEmptyExercises.writeAt, DateTime(2024, 7, 1));
        expect(progressWithEmptyExercises.exercises, isEmpty);

        // Parsing JSON with null exercises list
        final progressWithNullExercises =
            UserProgressDto.fromJson(jsonWithNullExercises).toDomain;
        expect(progressWithNullExercises.id, '123');
        expect(
          progressWithNullExercises.exerciseType,
          ExerciseType.wordSelection,
        );
        expect(progressWithNullExercises.writeAt, DateTime(2024, 7, 1));
        expect(progressWithNullExercises.exercises, isEmpty);
      },
    );

    test('should handle UserProgressDto to JSON correctly', () {
      final progress = UserProgressDto(
        id: '789',
        writeAt: DateTime(2024, 7, 1),
        exerciseType: ExerciseType.things,
        exercises: [], // Empty exercises list
      );

      final json = progress.toJson();

      expect(json['id'], '789');
      expect(json['writeAt'], '2024-07-01T00:00:00.000');
      expect(json['exerciseType'], 'things');
      expect(json['exercises'], isA<List>());
      expect(json['exercises'], isEmpty); // Should be an empty list
    });

    test('should convert UserExerciseDto to JSON correctly', () {
      const exercise = UserExerciseDto(
        id: 'ex1',
        lastAnswer: 'correct answer',
        isCorrect: true,
      );

      final json = exercise.toJson();

      expect(json['id'], 'ex1');
      expect(json['lastAnswer'], 'correct answer');
      expect(json['isCorrect'], true);
    });

    test('should convert Firestore Timestamp to DateTime', () {
      final timestamp = Timestamp(1651363200, 0);
      final dateTime = timeConvert(timestamp);
      expect(dateTime, isA<DateTime>());
    });
  });
}
