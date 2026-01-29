// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumberDtoImpl _$$NumberDtoImplFromJson(Map<String, dynamic> json) =>
    _$NumberDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      textTitle: json['textTitle'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => NumberExampleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      spell: NumberSpellDto.fromJson(
          handleNullableMapKey(json, 'spell') as Map<String, dynamic>),
      count: NumberCountDto.fromJson(
          handleNullableMapKey(json, 'count') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NumberDtoImplToJson(_$NumberDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'textTitle': instance.textTitle,
      'audio': instance.audio,
      'examples': instance.examples,
      'spell': instance.spell,
      'count': instance.count,
    };

_$NumberSpellDtoImpl _$$NumberSpellDtoImplFromJson(Map<String, dynamic> json) =>
    _$NumberSpellDtoImpl(
      audio: json['audio'] as String? ?? '',
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$NumberSpellDtoImplToJson(
        _$NumberSpellDtoImpl instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'details': instance.details,
    };

_$NumberCountDtoImpl _$$NumberCountDtoImplFromJson(Map<String, dynamic> json) =>
    _$NumberCountDtoImpl(
      noColor: json['noColor'] as String? ?? '',
      colored: json['colored'] as String? ?? '',
    );

Map<String, dynamic> _$$NumberCountDtoImplToJson(
        _$NumberCountDtoImpl instance) =>
    <String, dynamic>{
      'noColor': instance.noColor,
      'colored': instance.colored,
    };

_$NumberExampleDtoImpl _$$NumberExampleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NumberExampleDtoImpl(
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
    );

Map<String, dynamic> _$$NumberExampleDtoImplToJson(
        _$NumberExampleDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'audio': instance.audio,
    };
