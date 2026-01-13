// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThingDtoImpl _$$ThingDtoImplFromJson(Map<String, dynamic> json) =>
    _$ThingDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      image: json['image'] as String? ?? '',
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => ThingExampleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      order: (json['order'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ThingExerciseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalExercises: (json['totalExercises'] as num?)?.toInt() ?? 0,
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$ThingDtoImplToJson(_$ThingDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'audio': instance.audio,
      'image': instance.image,
      'examples': instance.examples,
      'order': instance.order,
      'type': instance.type,
      'exercises': instance.exercises,
      'totalExercises': instance.totalExercises,
      'isPremium': instance.isPremium,
    };

_$ThingExampleDtoImpl _$$ThingExampleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ThingExampleDtoImpl(
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
    );

Map<String, dynamic> _$$ThingExampleDtoImplToJson(
        _$ThingExampleDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'audio': instance.audio,
    };

_$ThingExerciseDtoImpl _$$ThingExerciseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ThingExerciseDtoImpl(
      id: json['id'] as String,
      answer: json['answer'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      image: json['image'] as String? ?? '',
      question: json['question'] as String? ?? '',
    );

Map<String, dynamic> _$$ThingExerciseDtoImplToJson(
        _$ThingExerciseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'choices': instance.choices,
      'image': instance.image,
      'question': instance.question,
    };
