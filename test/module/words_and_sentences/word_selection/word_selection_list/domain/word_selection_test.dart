import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/dto/word_selection_dto.dart';

void main() {
  group('WordSelectionDto', () {
    test('should create valid WordSelectionDto object', () {
      const dto = WordSelectionDto(
        id: 'ws1',
        title: 'Test Word Selection',
        exercises: [],
        totalExercises: 0,
        order: 0,
      );

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Selection');
      expect(dto.exercises, isEmpty);
    });
    test('empty factory should return an empty object', () {
      final emptyWordSelection = WordSelection.empty();

      expect(emptyWordSelection.id, '');
      expect(emptyWordSelection.exercises, isEmpty);
      expect(emptyWordSelection.title, '');
    });

    test('should convert JSON to WordSelectionDto correctly', () {
      final json = {
        'id': 'ws1',
        'title': 'Test Word Selection',
        'exercises': [],
      };

      final dto = WordSelectionDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Selection');
      expect(dto.exercises, isEmpty);
    });

    test('should convert WordSelectionDto to domain entity correctly', () {
      const dto = WordSelectionDto(
        id: 'ws1',
        title: 'Test Word Selection',
        exercises: [],
        totalExercises: 0,
        order: 0,
      );

      final domainEntity = dto.toDomain;

      expect(domainEntity.id, 'ws1');
      expect(domainEntity.title, 'Test Word Selection');
      expect(domainEntity.exercises, isEmpty);
    });
    test('should parse exercises correctly from JSON', () {
      final json = {
        'id': 'ws1',
        'title': 'Test Word Selection',
        'exercises': [
          {
            'id': 'ex1',
            'answer': 'A',
            'choices': ['A', 'B', 'C', 'D'],
            'question': 'What is Flutter?',
          },
        ],
      };

      final dto = WordSelectionDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Selection');
      expect(dto.exercises, isNotEmpty);
      expect(dto.exercises.first.id, 'ex1');
      expect(dto.exercises.first.answer, 'A');
    });
    test('should handle null exercises field gracefully', () {
      final json = {
        'id': 'ws1',
        'title': 'Test Word Selection',
        'exercises': null,
      };

      final dto = WordSelectionDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Selection');
      expect(dto.exercises, isEmpty);
    });

    test('should convert WordSelectionDto to JSON correctly', () {
      const dto = WordSelectionDto(
        id: 'ws1',
        title: 'Test Word Selection',
        exercises: [
          WordSelectionExerciseDto(
            id: 'ex1',
            answer: 'A',
            choices: ['A', 'B', 'C', 'D'],
            question: 'What is Flutter?',
          ),
        ],
        totalExercises: 1,
        order: 1,
      );

      final json = dto.toJson();

      expect(json, {
        'id': 'ws1',
        'title': 'Test Word Selection',
        'exercises': [
          const WordSelectionExerciseDto(
            id: 'ex1',
            answer: 'A',
            choices: ['A', 'B', 'C', 'D'],
            question: 'What is Flutter?',
          ),
        ],
        'totalExercises': 1,
        'order': 1,
        'isPremium': false,
      });
    });
  });
  group('WordSelectionExercise', () {
    test('should create valid WordSelectionExercise object', () {
      const exercise = WordSelectionExercise(
        id: 'ex1',
        choices: ['A', 'B', 'C', 'D'],
        question: 'What is Flutter?',
        answer: 'A',
      );

      expect(exercise.id, 'ex1');
      expect(exercise.choices, ['A', 'B', 'C', 'D']);
      expect(exercise.question, 'What is Flutter?');
      expect(exercise.answer, 'A');
    });

    test('empty factory should return an empty object', () {
      final emptyExercise = WordSelectionExercise.empty();

      expect(emptyExercise.id, '');
      expect(emptyExercise.choices, isEmpty);
      expect(emptyExercise.question, '');
      expect(emptyExercise.answer, '');
    });

    test('should support equality', () {
      const exercise1 = WordSelectionExercise(
        id: 'ex1',
        choices: ['A', 'B'],
        question: 'Q1',
        answer: 'A',
      );

      const exercise2 = WordSelectionExercise(
        id: 'ex1',
        choices: ['A', 'B'],
        question: 'Q1',
        answer: 'A',
      );

      const exercise3 = WordSelectionExercise(
        id: 'ex2',
        choices: ['X', 'Y'],
        question: 'Q2',
        answer: 'X',
      );

      expect(exercise1, equals(exercise2));
      expect(exercise1, isNot(equals(exercise3)));
    });
    test('should convert DTO to domain entity correctly', () {
      const dto = WordSelectionExerciseDto(
        id: 'ex1',
        answer: 'A',
        choices: ['A', 'B', 'C', 'D'],
        question: 'What is Flutter?',
      );

      final domainEntity = dto.toDomain;

      expect(domainEntity.id, 'ex1');
      expect(domainEntity.answer, 'A');
      expect(domainEntity.choices, ['A', 'B', 'C', 'D']);
      expect(domainEntity.question, 'What is Flutter?');
    });
    test('should convert JSON to WordSelectionExerciseDto correctly', () {
      final json = {
        'id': 'ex1',
        'answer': 'A',
        'choices': ['A', 'B', 'C', 'D'],
        'question': 'What is Flutter?',
      };

      final dto = WordSelectionExerciseDto.fromJson(json);

      expect(dto.id, 'ex1');
      expect(dto.answer, 'A');
      expect(dto.choices, ['A', 'B', 'C', 'D']);
      expect(dto.question, 'What is Flutter?');
    });
    test('should handle null choices field gracefully', () {
      final json = {
        'id': 'ex1',
        'answer': 'A',
        'choices': null,
        'question': 'What is Flutter?',
      };

      final dto = WordSelectionExerciseDto.fromJson(json);

      expect(dto.id, 'ex1');
      expect(dto.answer, 'A');
      expect(dto.choices, isEmpty);
    });

    test('should convert WordSelectionExerciseDto to JSON correctly', () {
      const dto = WordSelectionExerciseDto(
        id: 'ex1',
        answer: 'A',
        choices: ['A', 'B', 'C', 'D'],
        question: 'What is Flutter?',
      );

      final json = dto.toJson();

      expect(json, {
        'id': 'ex1',
        'answer': 'A',
        'choices': ['A', 'B', 'C', 'D'],
        'question': 'What is Flutter?',
      });
    });
  });
}
