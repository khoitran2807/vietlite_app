// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_selection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordSelectionDtoImpl _$$WordSelectionDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WordSelectionDtoImpl(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  totalExercises: (json['totalExercises'] as num?)?.toInt() ?? 0,
  order: (json['order'] as num?)?.toInt() ?? 0,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map(
            (e) => WordSelectionExerciseDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  isPremium: json['isPremium'] as bool? ?? false,
);

Map<String, dynamic> _$$WordSelectionDtoImplToJson(
  _$WordSelectionDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'totalExercises': instance.totalExercises,
  'order': instance.order,
  'exercises': instance.exercises,
  'isPremium': instance.isPremium,
};

_$WordSelectionExerciseDtoImpl _$$WordSelectionExerciseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WordSelectionExerciseDtoImpl(
  id: json['id'] as String,
  answer: json['answer'] as String? ?? '',
  choices:
      (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  question: json['question'] as String? ?? '',
);

Map<String, dynamic> _$$WordSelectionExerciseDtoImplToJson(
  _$WordSelectionExerciseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'answer': instance.answer,
  'choices': instance.choices,
  'question': instance.question,
};
