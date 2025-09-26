// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PremiumConfigImpl _$$PremiumConfigImplFromJson(Map<String, dynamic> json) =>
    _$PremiumConfigImpl(
      wordSelection: json['wordSelection'] as bool? ?? false,
      wordMatch: json['wordMatch'] as bool? ?? false,
      things: json['things'] as bool? ?? false,
    );

Map<String, dynamic> _$$PremiumConfigImplToJson(_$PremiumConfigImpl instance) =>
    <String, dynamic>{
      'wordSelection': instance.wordSelection,
      'wordMatch': instance.wordMatch,
      'things': instance.things,
    };
