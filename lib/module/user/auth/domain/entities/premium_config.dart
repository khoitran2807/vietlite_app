import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_config.freezed.dart';

part 'premium_config.g.dart';

@freezed
class PremiumConfig with _$PremiumConfig {
  const PremiumConfig._();

  const factory PremiumConfig({
    @Default(false) bool wordSelection,
    @Default(false) bool wordMatch,
    @Default(false) bool things,
  }) = _PremiumConfig;

  factory PremiumConfig.empty() => const PremiumConfig(
    wordSelection: false,
    wordMatch: false,
    things: false,
  );

  factory PremiumConfig.fromJson(Map<String, dynamic> json) =>
      _$PremiumConfigFromJson(json);
}
