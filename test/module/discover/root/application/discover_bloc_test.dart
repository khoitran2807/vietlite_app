import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/application/discover_bloc.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late DiscoverBloc discoverBloc;
  late MockDiscoverRepository mockDiscoverRepository;
  late AppFailure apiError;

  setUp(() {
    mockDiscoverRepository = MockDiscoverRepository();
    discoverBloc = DiscoverBloc(repository: mockDiscoverRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  tearDown(() {
    discoverBloc.close();
  });

  group('DiscoverBloc Test', () {
    final mockThings = [
      const Thing(
        id: '1',
        name: 'maudo',
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
        ],
        order: 1,
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        type: ThingType.color,
        image: '',
        exercises: [],
        totalExercises: 2,
        isPremium: false,
      ),
      const Thing(
        id: '2',
        name: 'mauxanh',
        examples: [
          CharacterExample(
            title: 'mauxanh1',
            image: 'mauxanh1.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
          CharacterExample(
            title: 'mauxanh2',
            image: 'mauxanh2.png',
            audio:
                'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
          ),
        ],
        order: 2,
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
        type: ThingType.color,
        image: '',
        exercises: [],
        totalExercises: 2,
        isPremium: false,
      ),
    ];
    blocTest<DiscoverBloc, DiscoverState>(
      'should emit [loading, success] when getThings succeeds',
      setUp: () {
        when(
          () => mockDiscoverRepository.getThings(),
        ).thenAnswer((_) async => Right(mockThings));
      },
      build: () => discoverBloc,
      act: (bloc) => bloc.add(const DiscoverEvent.initialize(userId: '1')),
      expect:
          () => [
            DiscoverState.initial().copyWith(
              isLoading: true,
              fetchFailure: none(),
            ),
            DiscoverState.initial().copyWith(
              things: mockThings,
              isLoading: false,
              fetchFailure: some(Right(mockThings)),
            ),
          ],
      verify: (_) {
        verify(() => mockDiscoverRepository.getThings()).called(1);
      },
    );

    blocTest<DiscoverBloc, DiscoverState>(
      'should emit [loading, failure] when getThings fails',
      setUp: () {
        when(
          () => mockDiscoverRepository.getThings(),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => discoverBloc,
      act: (bloc) => bloc.add(const DiscoverEvent.initialize(userId: '1')),
      expect:
          () => [
            DiscoverState.initial().copyWith(
              isLoading: true,
              fetchFailure: none(),
            ),
            DiscoverState.initial().copyWith(
              isLoading: false,
              fetchFailure: some(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockDiscoverRepository.getThings()).called(1);
      },
    );
  });
}
