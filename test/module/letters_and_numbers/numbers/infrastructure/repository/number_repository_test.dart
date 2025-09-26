import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/repository/number_repository.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late NumberRepository repository;
  late MockNumberRemoteDataSource mockNumberRemoteDataSource;

  setUp(() {
    mockNumberRemoteDataSource = MockNumberRemoteDataSource();
    repository = NumberRepository(remoteDataSource: mockNumberRemoteDataSource);
  });

  group('Number Repository Test', () {
    test(
      'should return list of Number when remoteDataSource succeeds',
      () async {
        final mockNumbers = [
          const Number(
            id: '1',
            title: '1',
            textTitle: '',
            audio: '',
            spell: NumberSpell(
              audio: 'https://google.com.vn',
              details: ['m', 'ột', 'một'],
            ),
            examples: [
              CharacterExample(
                title: '1',
                image: 'https://example.com/image1.jpg',
                audio: 'https://example.com/audio1.mp3',
              ),
              CharacterExample(
                title: '1',
                image: 'https://example.com/image2.jpg',
                audio: 'https://example.com/audio2.mp3',
              ),
            ],
            count: NumberCount(noColor: 'noColor', colored: 'colored'),
          ),
          const Number(
            id: '2',
            title: '2',
            textTitle: '',
            audio: '',
            spell: NumberSpell(
              audio: 'https://google.com.vn',
              details: ['h', 'ai', 'hai'],
            ),
            examples: [
              CharacterExample(
                title: '2',
                image: 'https://example.com/image1.jpg',
                audio: 'https://example.com/audio1.mp3',
              ),
              CharacterExample(
                title: '2',
                image: 'https://example.com/image2.jpg',
                audio: 'https://example.com/audio2.mp3',
              ),
            ],
            count: NumberCount(noColor: 'noColor', colored: 'colored'),
          ),
        ];

        when(
          () => mockNumberRemoteDataSource.getNumbers(),
        ).thenAnswer((_) async => mockNumbers);

        // Act
        final result = await repository.getNumbers();

        // Assert
        expect(result, Right(mockNumbers));
        verify(() => mockNumberRemoteDataSource.getNumbers()).called(1);
        verifyNoMoreInteractions(mockNumberRemoteDataSource);
      },
    );

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => mockNumberRemoteDataSource.getNumbers(),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getNumbers();

        // Assert
        expect(result, isA<Left<AppFailure, List<Number>>>());
        verify(() => mockNumberRemoteDataSource.getNumbers()).called(1);
      },
    );
  });
}
