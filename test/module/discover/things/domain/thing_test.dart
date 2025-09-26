import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

void main() {
  group('Thing Entity', () {
    test('should create a valid Thing instance', () {
      const thing = Thing(
        id: '1',
        name: 'màu đỏ',
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
          CharacterExample(
            title: 'maudo3',
            image: 'maudo3.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
        ],
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        order: 1,
        type: ThingType.color,
        image: 'maudo.png',
        exercises: [],
        totalExercises: 2,
        isPremium: false,
      );

      expect(thing.id, '1');
      expect(thing.order, 1);
      expect(thing.name, 'màu đỏ');
      expect(thing.examples.length, 3);
      expect(thing.examples.first.title, 'maudo1');
      expect(thing.examples.first.image, 'maudo1.png');
    });

    test(
      'ThingExample empty factory should return an object with default values',
      () {
        final example = CharacterExample.empty();
        expect(example.title, '');
        expect(example.image, '');
        expect(example.audio, '');
      },
    );

    test('Thing empty factory should return an object with default values', () {
      final thing = Thing.empty();
      expect(thing.id, '');
      expect(thing.name, '');
      expect(thing.examples, []);
    });
  });

  group('ThingExample Entity', () {
    test('should create a valid ThingExample instance', () {
      const example = CharacterExample(
        title: 'maudo1',
        image: 'maudo1.png',
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );

      expect(example.title, 'maudo1');
      expect(example.image, 'maudo1.png');
      expect(
        example.audio,
        'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      );
    });
  });
  group('ThingExerciseDto', () {
    test('should create a valid ThingExerciseDto instance from JSON', () {
      final json = {
        'id': 'ex1',
        'answer': 'red',
        'choices': ['red', 'green'],
        'image': 'apple.png',
        'question': 'What color is the apple?',
      };

      final dto = ThingExerciseDto.fromJson(json);

      expect(dto.id, 'ex1');
      expect(dto.answer, 'red');
      expect(dto.choices, ['red', 'green']);
      expect(dto.image, 'apple.png');
      expect(dto.question, 'What color is the apple?');
    });

    test('toDomain should convert DTO to ThingExercise correctly', () {
      const dto = ThingExerciseDto(
        id: 'ex1',
        answer: 'red',
        choices: ['red', 'green'],
        image: 'apple.png',
        question: 'What color is the apple?',
      );

      final domain = dto.toDomain;

      expect(domain.id, 'ex1');
      expect(domain.answer, 'red');
      expect(domain.choices, ['red', 'green']);
      expect(domain.image, 'apple.png');
      expect(domain.question, 'What color is the apple?');
    });

    test('toJson and fromJson should work correctly', () {
      const dto = ThingExerciseDto(
        id: 'ex1',
        answer: 'red',
        choices: ['red', 'green'],
        image: 'apple.png',
        question: 'What color is the apple?',
      );

      final json = dto.toJson();
      final newDto = ThingExerciseDto.fromJson(json);

      expect(newDto.id, dto.id);
      expect(newDto.answer, dto.answer);
      expect(newDto.choices, dto.choices);
      expect(newDto.image, dto.image);
      expect(newDto.question, dto.question);
    });
  });

  group('ThingExampleDto', () {
    test('toJson and fromJson should work correctly', () {
      const dto = ThingExampleDto(
        title: 'example1',
        image: 'img.png',
        audio: 'audio.mp3',
      );

      final json = dto.toJson();
      final newDto = ThingExampleDto.fromJson(json);

      expect(newDto.title, dto.title);
      expect(newDto.image, dto.image);
      expect(newDto.audio, dto.audio);
    });
  });

  group('ThingDto JSON', () {
    test('should create ThingDto from JSON without nested toJson check', () {
      final json = {
        'id': '1',
        'name': 'Red',
        'audio': 'audio.mp3',
        'image': 'img.png',
        'examples': [
          {'title': 'ex1', 'image': 'img.png', 'audio': ''},
        ],
        'exercises': [
          {
            'id': 'ex1',
            'answer': 'red',
            'choices': ['red', 'green'],
            'image': 'apple.png',
            'question': 'What color is the apple?',
          },
        ],
        'order': 1,
        'type': 'color',
        'totalExercises': 1,
        'isPremium': false,
      };

      final dto = ThingDto.fromJson(json);

      expect(dto.id, '1');
      expect(dto.name, 'Red');
      expect(dto.audio, 'audio.mp3');
      expect(dto.examples.length, 1);
      expect(dto.exercises.length, 1);

      // chỉ check các property primitive / list length, không check nested DTO map
    });
  });
}
