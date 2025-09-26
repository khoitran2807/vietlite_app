// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LetterDtoImpl _$$LetterDtoImplFromJson(Map<String, dynamic> json) =>
    _$LetterDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      audioTitle: json['audioTitle'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
      mainExample: LetterExampleDto.fromJson(
        handleNullableMapKey(json, 'mainExample') as Map<String, dynamic>,
      ),
      spell: LetterSpellDto.fromJson(
        handleNullableMapKey(json, 'spell') as Map<String, dynamic>,
      ),
      examples:
          (json['examples'] as List<dynamic>?)
              ?.map((e) => LetterExampleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$LetterDtoImplToJson(_$LetterDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'audioTitle': instance.audioTitle,
      'order': instance.order,
      'mainExample': instance.mainExample,
      'spell': instance.spell,
      'examples': instance.examples,
    };

_$LetterExampleDtoImpl _$$LetterExampleDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LetterExampleDtoImpl(
  title: json['title'] as String? ?? '',
  image: json['image'] as String? ?? '',
  audio: json['audio'] as String? ?? '',
);

Map<String, dynamic> _$$LetterExampleDtoImplToJson(
  _$LetterExampleDtoImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'image': instance.image,
  'audio': instance.audio,
};

_$LetterSpellDtoImpl _$$LetterSpellDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LetterSpellDtoImpl(
  spells:
      (json['spells'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  accents:
      (json['accents'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  audioSpell: json['audioSpell'] as String? ?? '',
  audioAccent: json['audioAccent'] as String? ?? '',
);

Map<String, dynamic> _$$LetterSpellDtoImplToJson(
  _$LetterSpellDtoImpl instance,
) => <String, dynamic>{
  'spells': instance.spells,
  'accents': instance.accents,
  'audioSpell': instance.audioSpell,
  'audioAccent': instance.audioAccent,
};
