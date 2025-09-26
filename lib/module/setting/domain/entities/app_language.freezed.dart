// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppLanguage {
  LanguageCode get languageCode => throw _privateConstructorUsedError;

  /// Create a copy of AppLanguage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLanguageCopyWith<AppLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLanguageCopyWith<$Res> {
  factory $AppLanguageCopyWith(
    AppLanguage value,
    $Res Function(AppLanguage) then,
  ) = _$AppLanguageCopyWithImpl<$Res, AppLanguage>;
  @useResult
  $Res call({LanguageCode languageCode});
}

/// @nodoc
class _$AppLanguageCopyWithImpl<$Res, $Val extends AppLanguage>
    implements $AppLanguageCopyWith<$Res> {
  _$AppLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLanguage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? languageCode = null}) {
    return _then(
      _value.copyWith(
            languageCode:
                null == languageCode
                    ? _value.languageCode
                    : languageCode // ignore: cast_nullable_to_non_nullable
                        as LanguageCode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppLanguageImplCopyWith<$Res>
    implements $AppLanguageCopyWith<$Res> {
  factory _$$AppLanguageImplCopyWith(
    _$AppLanguageImpl value,
    $Res Function(_$AppLanguageImpl) then,
  ) = __$$AppLanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LanguageCode languageCode});
}

/// @nodoc
class __$$AppLanguageImplCopyWithImpl<$Res>
    extends _$AppLanguageCopyWithImpl<$Res, _$AppLanguageImpl>
    implements _$$AppLanguageImplCopyWith<$Res> {
  __$$AppLanguageImplCopyWithImpl(
    _$AppLanguageImpl _value,
    $Res Function(_$AppLanguageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppLanguage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? languageCode = null}) {
    return _then(
      _$AppLanguageImpl(
        languageCode:
            null == languageCode
                ? _value.languageCode
                : languageCode // ignore: cast_nullable_to_non_nullable
                    as LanguageCode,
      ),
    );
  }
}

/// @nodoc

class _$AppLanguageImpl extends _AppLanguage {
  const _$AppLanguageImpl({required this.languageCode}) : super._();

  @override
  final LanguageCode languageCode;

  @override
  String toString() {
    return 'AppLanguage(languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLanguageImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  /// Create a copy of AppLanguage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLanguageImplCopyWith<_$AppLanguageImpl> get copyWith =>
      __$$AppLanguageImplCopyWithImpl<_$AppLanguageImpl>(this, _$identity);
}

abstract class _AppLanguage extends AppLanguage {
  const factory _AppLanguage({required final LanguageCode languageCode}) =
      _$AppLanguageImpl;
  const _AppLanguage._() : super._();

  @override
  LanguageCode get languageCode;

  /// Create a copy of AppLanguage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLanguageImplCopyWith<_$AppLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
