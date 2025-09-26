// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppTheme {
  ThemeCode get themeCode => throw _privateConstructorUsedError;

  /// Create a copy of AppTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppThemeCopyWith<AppTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeCopyWith<$Res> {
  factory $AppThemeCopyWith(AppTheme value, $Res Function(AppTheme) then) =
      _$AppThemeCopyWithImpl<$Res, AppTheme>;
  @useResult
  $Res call({ThemeCode themeCode});
}

/// @nodoc
class _$AppThemeCopyWithImpl<$Res, $Val extends AppTheme>
    implements $AppThemeCopyWith<$Res> {
  _$AppThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeCode = null}) {
    return _then(
      _value.copyWith(
            themeCode:
                null == themeCode
                    ? _value.themeCode
                    : themeCode // ignore: cast_nullable_to_non_nullable
                        as ThemeCode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeCodeImplCopyWith<$Res>
    implements $AppThemeCopyWith<$Res> {
  factory _$$ThemeCodeImplCopyWith(
    _$ThemeCodeImpl value,
    $Res Function(_$ThemeCodeImpl) then,
  ) = __$$ThemeCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeCode themeCode});
}

/// @nodoc
class __$$ThemeCodeImplCopyWithImpl<$Res>
    extends _$AppThemeCopyWithImpl<$Res, _$ThemeCodeImpl>
    implements _$$ThemeCodeImplCopyWith<$Res> {
  __$$ThemeCodeImplCopyWithImpl(
    _$ThemeCodeImpl _value,
    $Res Function(_$ThemeCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeCode = null}) {
    return _then(
      _$ThemeCodeImpl(
        themeCode:
            null == themeCode
                ? _value.themeCode
                : themeCode // ignore: cast_nullable_to_non_nullable
                    as ThemeCode,
      ),
    );
  }
}

/// @nodoc

class _$ThemeCodeImpl extends _ThemeCode {
  const _$ThemeCodeImpl({required this.themeCode}) : super._();

  @override
  final ThemeCode themeCode;

  @override
  String toString() {
    return 'AppTheme(themeCode: $themeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCodeImpl &&
            (identical(other.themeCode, themeCode) ||
                other.themeCode == themeCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeCode);

  /// Create a copy of AppTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCodeImplCopyWith<_$ThemeCodeImpl> get copyWith =>
      __$$ThemeCodeImplCopyWithImpl<_$ThemeCodeImpl>(this, _$identity);
}

abstract class _ThemeCode extends AppTheme {
  const factory _ThemeCode({required final ThemeCode themeCode}) =
      _$ThemeCodeImpl;
  const _ThemeCode._() : super._();

  @override
  ThemeCode get themeCode;

  /// Create a copy of AppTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeCodeImplCopyWith<_$ThemeCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
