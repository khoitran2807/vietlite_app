import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/application/letters_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late LettersBloc lettersBloc;
  late MockLetterRepository mockLetterRepository;
  late AppFailure apiError;

  setUp(() {
    mockLetterRepository = MockLetterRepository();
    lettersBloc = LettersBloc(repository: mockLetterRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  tearDown(() {
    lettersBloc.close();
  });

  group('LetterBloc Test', () {
    const testUserId = 'user_1';
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
    blocTest<LettersBloc, LettersState>(
      'should emit [loading, success] when getLetters succeeds',
      build: () {
        when(
          () => mockLetterRepository.getLetters(),
        ).thenAnswer((_) async => Right(mockLetters));
        return lettersBloc;
      },
      act:
          (bloc) => bloc.add(const LettersEvent.initialize(userId: testUserId)),
      expect:
          () => [
            LettersState.initial().copyWith(isLoading: true),
            LettersState.initial().copyWith(
              letters: mockLetters,
              isLoading: false,
              fetchFailure: optionOf(Right(mockLetters)),
            ),
          ],
      verify: (_) {
        verify(() => mockLetterRepository.getLetters()).called(1);
      },
    );

    blocTest<LettersBloc, LettersState>(
      'should emit [loading, failure] when getLetters fails',
      build: () {
        when(
          () => mockLetterRepository.getLetters(),
        ).thenAnswer((_) async => Left(apiError));
        return lettersBloc;
      },
      act:
          (bloc) => bloc.add(const LettersEvent.initialize(userId: testUserId)),
      expect:
          () => [
            LettersState.initial().copyWith(isLoading: true),
            LettersState.initial().copyWith(
              isLoading: false,
              fetchFailure: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockLetterRepository.getLetters()).called(1);
      },
    );
  });
}
