import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';

part 'thing.freezed.dart';

@freezed
class Thing with _$Thing {
  const Thing._();

  const factory Thing({
    required String id,
    required String name,
    required String audio,
    required String image,
    required List<CharacterExample> examples,
    required int order,
    required ThingType type,
    required List<ThingExercise> exercises,
    required int totalExercises,
  }) = _Thing;

  factory Thing.empty() => const Thing(
    id: '',
    name: '',
    audio: '',
    image: '',
    examples: [],
    type: ThingType.color,
    order: 0,
    exercises: [],
    totalExercises: 0,
  );
}

@freezed
class ThingExercise with _$ThingExercise {
  const ThingExercise._();

  const factory ThingExercise({
    required String id,
    required List<String> choices,
    required String answer,
    required String image,
    required String question,
  }) = _ThingExercise;

  factory ThingExercise.empty() => const ThingExercise(
    id: '',
    choices: [],
    answer: '',
    image: '',
    question: '',
  );
}
