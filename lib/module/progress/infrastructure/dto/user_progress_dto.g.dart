// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgressDtoImpl _$$UserProgressDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProgressDtoImpl(
      id: json['id'] as String,
      writeAt: timeConvert(json['writeAt']),
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => UserExerciseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      exerciseType:
          $enumDecodeNullable(_$ExerciseTypeEnumMap, json['exerciseType']) ??
              ExerciseType.other,
    );

Map<String, dynamic> _$$UserProgressDtoImplToJson(
        _$UserProgressDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'writeAt': instance.writeAt?.toIso8601String(),
      'exercises': instance.exercises,
      'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType]!,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.letter: 'letter',
  ExerciseType.number: 'number',
  ExerciseType.wordSelection: 'wordSelection',
  ExerciseType.wordMatch: 'wordMatch',
  ExerciseType.story: 'story',
  ExerciseType.things: 'things',
  ExerciseType.other: 'other',
};

_$UserExerciseDtoImpl _$$UserExerciseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserExerciseDtoImpl(
      id: json['id'] as String,
      lastAnswer: json['lastAnswer'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserExerciseDtoImplToJson(
        _$UserExerciseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastAnswer': instance.lastAnswer,
      'isCorrect': instance.isCorrect,
    };
