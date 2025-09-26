import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/repository/letter_repository.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late LetterRepository repository;
  late MockLetterRemoteDataSource mockLetterRemoteDataSource;

  setUp(() {
    mockLetterRemoteDataSource = MockLetterRemoteDataSource();
    repository = LetterRepository(remoteDataSource: mockLetterRemoteDataSource);
  });

  group('Letter Repository Test', () {
    test('should return list of Letter when remoteDataSource succeeds', () async {
      final mockLetters = [
        const Letter(
          id: '1',
          title: 'A',
          mainExample: CharacterExample(
            title: 'Apple',
            image: 'apple.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          spell: LetterSpell(
            accents: ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
            audioAccent:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            spells: ['u', 'yên', 'uyên'],
            audioSpell:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          examples: [
            CharacterExample(
              title: 'Ant',
              image: 'ant.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
            CharacterExample(
              title: 'Airplane',
              image: 'airplane.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
          ],
          audioTitle:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          order: 1,
        ),
        const Letter(
          id: '2',
          title: 'B',
          mainExample: CharacterExample(
            title: 'Boil',
            image: 'boil.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          spell: LetterSpell(
            accents: ['B'],
            audioAccent:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            spells: ['u', 'yên', 'uyên'],
            audioSpell:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          examples: [
            CharacterExample(
              title: 'Black',
              image: 'ant.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
            CharacterExample(
              title: 'Bottle',
              image: 'bottle.png',
              audio:
                  'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
            ),
          ],
          audioTitle:
              'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          order: 2,
        ),
      ];

      when(
        () => mockLetterRemoteDataSource.getLetters(),
      ).thenAnswer((_) async => mockLetters);

      // Act
      final result = await repository.getLetters();

      // Assert
      expect(result, Right(mockLetters));
      verify(() => mockLetterRemoteDataSource.getLetters()).called(1);
      verifyNoMoreInteractions(mockLetterRemoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => mockLetterRemoteDataSource.getLetters(),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getLetters();

        // Assert
        expect(result, isA<Left<AppFailure, List<Letter>>>());
        verify(() => mockLetterRemoteDataSource.getLetters()).called(1);
      },
    );
  });
}
