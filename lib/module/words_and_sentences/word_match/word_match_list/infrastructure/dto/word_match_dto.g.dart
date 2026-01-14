// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordMatchDtoImpl _$$WordMatchDtoImplFromJson(Map<String, dynamic> json) =>
    _$WordMatchDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
      totalExercises: (json['totalExercises'] as num?)?.toInt() ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) =>
                  WordMatchExerciseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$WordMatchDtoImplToJson(_$WordMatchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
      'totalExercises': instance.totalExercises,
      'exercises': instance.exercises,
      'isPremium': instance.isPremium,
    };

_$WordMatchExerciseDtoImpl _$$WordMatchExerciseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WordMatchExerciseDtoImpl(
      id: json['id'] as String,
      answer: json['answer'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$WordMatchExerciseDtoImplToJson(
        _$WordMatchExerciseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'choices': instance.choices,
      'image': instance.image,
    };
