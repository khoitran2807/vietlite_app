import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/application/number_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late NumbersBloc numbersBloc;
  late MockNumberRepository mockNumberRepository;
  late AppFailure apiError;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    numbersBloc = NumbersBloc(repository: mockNumberRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  tearDown(() {
    numbersBloc.close();
  });

  group('NumberBloc Test', () {
    const testUserId = 'user_1';
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
        examples: [],
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
        examples: [],
        count: NumberCount(noColor: 'noColor', colored: 'colored'),
      ),
    ];

    blocTest<NumbersBloc, NumberState>(
      'should emit [loading, success] when getNumbers succeeds',
      build: () {
        when(
          () => mockNumberRepository.getNumbers(),
        ).thenAnswer((_) async => Right(mockNumbers));
        return numbersBloc;
      },
      act: (bloc) => bloc.add(const NumberEvent.initialize(userId: testUserId)),
      expect:
          () => [
            NumberState.initial().copyWith(isLoading: true),
            NumberState.initial().copyWith(
              numbers: mockNumbers,
              isLoading: false,
              fetchFailure: optionOf(Right(mockNumbers)),
            ),
          ],
      verify: (_) {
        verify(() => mockNumberRepository.getNumbers()).called(1);
      },
    );

    blocTest<NumbersBloc, NumberState>(
      'should emit [loading, failure] when getNumbers fails',
      build: () {
        when(
          () => mockNumberRepository.getNumbers(),
        ).thenAnswer((_) async => Left(apiError));
        return numbersBloc;
      },
      act: (bloc) => bloc.add(const NumberEvent.initialize(userId: testUserId)),
      expect:
          () => [
            NumberState.initial().copyWith(isLoading: true),
            NumberState.initial().copyWith(
              isLoading: false,
              fetchFailure: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockNumberRepository.getNumbers()).called(1);
      },
    );
  });
}
