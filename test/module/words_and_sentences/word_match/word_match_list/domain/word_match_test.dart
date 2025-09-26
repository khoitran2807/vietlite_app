import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/dto/word_match_dto.dart';

void main() {
  group('WordMatchDto', () {
    test('should create valid WordMatchDto object', () {
      const dto = WordMatchDto(
        id: 'ws1',
        title: 'Test Word Match',
        exercises: [],
        totalExercises: 0,
        order: 0,
        isPremium: false,
      );

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Match');
      expect(dto.exercises, isEmpty);
    });
    test('empty factory should return an empty object', () {
      final emptyWordMatch = WordMatch.empty();

      expect(emptyWordMatch.id, '');
      expect(emptyWordMatch.exercises, isEmpty);
      expect(emptyWordMatch.title, '');
    });

    test('should convert JSON to WordMatchDto correctly', () {
      final json = {'id': 'ws1', 'title': 'Test Word Match', 'exercises': []};

      final dto = WordMatchDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Match');
      expect(dto.exercises, isEmpty);
    });

    test('should convert WordMatchDto to domain entity correctly', () {
      const dto = WordMatchDto(
        id: 'ws1',
        title: 'Test Word Match',
        exercises: [],
        totalExercises: 0,
        order: 0,
        isPremium: false,
      );

      final domainEntity = dto.toDomain;

      expect(domainEntity.id, 'ws1');
      expect(domainEntity.title, 'Test Word Match');
      expect(domainEntity.exercises, isEmpty);
    });
    test('should parse exercises correctly from JSON', () {
      final json = {
        'id': 'ws1',
        'title': 'Test Word Match',
        'exercises': [
          {
            'id': 'ex1',
            'answer': 'A',
            'choices': ['A', 'B', 'C', 'D'],
            'image': 'apple.png',
          },
        ],
      };

      final dto = WordMatchDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Match');
      expect(dto.exercises, isNotEmpty);
      expect(dto.exercises.first.id, 'ex1');
      expect(dto.exercises.first.answer, 'A');
    });
    test('should handle null exercises field gracefully', () {
      final json = {'id': 'ws1', 'title': 'Test Word Match', 'exercises': null};

      final dto = WordMatchDto.fromJson(json);

      expect(dto.id, 'ws1');
      expect(dto.title, 'Test Word Match');
      expect(dto.exercises, isEmpty);
    });

    test('should convert WordMatchDto to JSON correctly', () {
      const dto = WordMatchDto(
        id: 'ws1',
        title: 'Test Word Match',
        exercises: [
          WordMatchExerciseDto(
            id: 'ex1',
            answer: 'A',
            choices: ['A', 'B', 'C', 'D'],
            image: 'apple.png',
          ),
        ],
        totalExercises: 1,
        order: 1,
        isPremium: false,
      );

      final json = dto.toJson();

      expect(json, {
        'id': 'ws1',
        'title': 'Test Word Match',
        'exercises': [
          const WordMatchExerciseDto(
            id: 'ex1',
            answer: 'A',
            choices: ['A', 'B', 'C', 'D'],
            image: 'apple.png',
          ),
        ],
        'totalExercises': 1,
        'order': 1,
        'isPremium': false,
      });
    });
  });
  group('WordMatchExercise', () {
    test('should create valid WordMatchExercise object', () {
      const exercise = WordMatchExercise(
        id: 'ex1',
        choices: ['A', 'B', 'C', 'D'],
        image: 'apple.png',
        answer: 'A',
      );

      expect(exercise.id, 'ex1');
      expect(exercise.choices, ['A', 'B', 'C', 'D']);
      expect(exercise.image, 'apple.png');
      expect(exercise.answer, 'A');
    });

    test('empty factory should return an empty object', () {
      final emptyExercise = WordMatchExercise.empty();

      expect(emptyExercise.id, '');
      expect(emptyExercise.choices, isEmpty);
      expect(emptyExercise.image, '');
      expect(emptyExercise.answer, '');
    });

    test('should support equality', () {
      const exercise1 = WordMatchExercise(
        id: 'ex1',
        choices: ['A', 'B'],
        image: 'apple.png',
        answer: 'A',
      );

      const exercise2 = WordMatchExercise(
        id: 'ex1',
        choices: ['A', 'B'],
        image: 'apple.png',
        answer: 'A',
      );

      const exercise3 = WordMatchExercise(
        id: 'ex2',
        choices: ['X', 'Y'],
        image: 'lemon.png',
        answer: 'X',
      );

      expect(exercise1, equals(exercise2));
      expect(exercise1, isNot(equals(exercise3)));
    });
    test('should convert DTO to domain entity correctly', () {
      const dto = WordMatchExerciseDto(
        id: 'ex1',
        answer: 'A',
        choices: ['A', 'B', 'C', 'D'],
        image: 'lemon.png',
      );

      final domainEntity = dto.toDomain;

      expect(domainEntity.id, 'ex1');
      expect(domainEntity.answer, 'A');
      expect(domainEntity.choices, ['A', 'B', 'C', 'D']);
      expect(domainEntity.image, 'lemon.png');
    });
    test('should convert JSON to WordMatchExerciseDto correctly', () {
      final json = {
        'id': 'ex1',
        'answer': 'A',
        'choices': ['A', 'B', 'C', 'D'],
        'image': 'lemon.png',
      };

      final dto = WordMatchExerciseDto.fromJson(json);

      expect(dto.id, 'ex1');
      expect(dto.answer, 'A');
      expect(dto.choices, ['A', 'B', 'C', 'D']);
      expect(dto.image, 'lemon.png');
    });
    test('should handle null choices field gracefully', () {
      final json = {
        'id': 'ex1',
        'answer': 'A',
        'choices': null,
        'image': 'lemon.png',
      };

      final dto = WordMatchExerciseDto.fromJson(json);

      expect(dto.id, 'ex1');
      expect(dto.answer, 'A');
      expect(dto.choices, isEmpty);
    });

    test('should convert WordMatchExerciseDto to JSON correctly', () {
      const dto = WordMatchExerciseDto(
        id: 'ex1',
        answer: 'A',
        choices: ['A', 'B', 'C', 'D'],
        image: 'lemon.png',
      );

      final json = dto.toJson();

      expect(json, {
        'id': 'ex1',
        'answer': 'A',
        'choices': ['A', 'B', 'C', 'D'],
        'image': 'lemon.png',
      });
    });
  });
}
