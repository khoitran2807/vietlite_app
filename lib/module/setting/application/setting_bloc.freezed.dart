// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LanguageCode languageCode, ThemeCode themeCode)
        initialize,
    required TResult Function(AppLanguage language) changeLocale,
    required TResult Function(AppTheme theme) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult? Function(AppLanguage language)? changeLocale,
    TResult? Function(AppTheme theme)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult Function(AppLanguage language)? changeLocale,
    TResult Function(AppTheme theme)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeLocale value) changeLocale,
    required TResult Function(_ChangeTheme value) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeLocale value)? changeLocale,
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeLocale value)? changeLocale,
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingEventCopyWith<$Res> {
  factory $SettingEventCopyWith(
          SettingEvent value, $Res Function(SettingEvent) then) =
      _$SettingEventCopyWithImpl<$Res, SettingEvent>;
}

/// @nodoc
class _$SettingEventCopyWithImpl<$Res, $Val extends SettingEvent>
    implements $SettingEventCopyWith<$Res> {
  _$SettingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LanguageCode languageCode, ThemeCode themeCode});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? themeCode = null,
  }) {
    return _then(_$InitializeImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode,
      themeCode: null == themeCode
          ? _value.themeCode
          : themeCode // ignore: cast_nullable_to_non_nullable
              as ThemeCode,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.languageCode, required this.themeCode});

  @override
  final LanguageCode languageCode;
  @override
  final ThemeCode themeCode;

  @override
  String toString() {
    return 'SettingEvent.initialize(languageCode: $languageCode, themeCode: $themeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.themeCode, themeCode) ||
                other.themeCode == themeCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode, themeCode);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LanguageCode languageCode, ThemeCode themeCode)
        initialize,
    required TResult Function(AppLanguage language) changeLocale,
    required TResult Function(AppTheme theme) changeTheme,
  }) {
    return initialize(languageCode, themeCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult? Function(AppLanguage language)? changeLocale,
    TResult? Function(AppTheme theme)? changeTheme,
  }) {
    return initialize?.call(languageCode, themeCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult Function(AppLanguage language)? changeLocale,
    TResult Function(AppTheme theme)? changeTheme,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(languageCode, themeCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeLocale value) changeLocale,
    required TResult Function(_ChangeTheme value) changeTheme,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeLocale value)? changeLocale,
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeLocale value)? changeLocale,
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements SettingEvent {
  const factory _Initialize(
      {required final LanguageCode languageCode,
      required final ThemeCode themeCode}) = _$InitializeImpl;

  LanguageCode get languageCode;
  ThemeCode get themeCode;

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeLocaleImplCopyWith<$Res> {
  factory _$$ChangeLocaleImplCopyWith(
          _$ChangeLocaleImpl value, $Res Function(_$ChangeLocaleImpl) then) =
      __$$ChangeLocaleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLanguage language});

  $AppLanguageCopyWith<$Res> get language;
}

/// @nodoc
class __$$ChangeLocaleImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$ChangeLocaleImpl>
    implements _$$ChangeLocaleImplCopyWith<$Res> {
  __$$ChangeLocaleImplCopyWithImpl(
      _$ChangeLocaleImpl _value, $Res Function(_$ChangeLocaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$ChangeLocaleImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as AppLanguage,
    ));
  }

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppLanguageCopyWith<$Res> get language {
    return $AppLanguageCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value));
    });
  }
}

/// @nodoc

class _$ChangeLocaleImpl implements _ChangeLocale {
  const _$ChangeLocaleImpl({required this.language});

  @override
  final AppLanguage language;

  @override
  String toString() {
    return 'SettingEvent.changeLocale(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLocaleImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLocaleImplCopyWith<_$ChangeLocaleImpl> get copyWith =>
      __$$ChangeLocaleImplCopyWithImpl<_$ChangeLocaleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LanguageCode languageCode, ThemeCode themeCode)
        initialize,
    required TResult Function(AppLanguage language) changeLocale,
    required TResult Function(AppTheme theme) changeTheme,
  }) {
    return changeLocale(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult? Function(AppLanguage language)? changeLocale,
    TResult? Function(AppTheme theme)? changeTheme,
  }) {
    return changeLocale?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult Function(AppLanguage language)? changeLocale,
    TResult Function(AppTheme theme)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeLocale != null) {
      return changeLocale(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeLocale value) changeLocale,
    required TResult Function(_ChangeTheme value) changeTheme,
  }) {
    return changeLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeLocale value)? changeLocale,
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) {
    return changeLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeLocale value)? changeLocale,
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeLocale != null) {
      return changeLocale(this);
    }
    return orElse();
  }
}

abstract class _ChangeLocale implements SettingEvent {
  const factory _ChangeLocale({required final AppLanguage language}) =
      _$ChangeLocaleImpl;

  AppLanguage get language;

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeLocaleImplCopyWith<_$ChangeLocaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeThemeImplCopyWith<$Res> {
  factory _$$ChangeThemeImplCopyWith(
          _$ChangeThemeImpl value, $Res Function(_$ChangeThemeImpl) then) =
      __$$ChangeThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppTheme theme});

  $AppThemeCopyWith<$Res> get theme;
}

/// @nodoc
class __$$ChangeThemeImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$ChangeThemeImpl>
    implements _$$ChangeThemeImplCopyWith<$Res> {
  __$$ChangeThemeImplCopyWithImpl(
      _$ChangeThemeImpl _value, $Res Function(_$ChangeThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
  }) {
    return _then(_$ChangeThemeImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppThemeCopyWith<$Res> get theme {
    return $AppThemeCopyWith<$Res>(_value.theme, (value) {
      return _then(_value.copyWith(theme: value));
    });
  }
}

/// @nodoc

class _$ChangeThemeImpl implements _ChangeTheme {
  const _$ChangeThemeImpl({required this.theme});

  @override
  final AppTheme theme;

  @override
  String toString() {
    return 'SettingEvent.changeTheme(theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      __$$ChangeThemeImplCopyWithImpl<_$ChangeThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LanguageCode languageCode, ThemeCode themeCode)
        initialize,
    required TResult Function(AppLanguage language) changeLocale,
    required TResult Function(AppTheme theme) changeTheme,
  }) {
    return changeTheme(theme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult? Function(AppLanguage language)? changeLocale,
    TResult? Function(AppTheme theme)? changeTheme,
  }) {
    return changeTheme?.call(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LanguageCode languageCode, ThemeCode themeCode)?
        initialize,
    TResult Function(AppLanguage language)? changeLocale,
    TResult Function(AppTheme theme)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeLocale value) changeLocale,
    required TResult Function(_ChangeTheme value) changeTheme,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeLocale value)? changeLocale,
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeLocale value)? changeLocale,
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class _ChangeTheme implements SettingEvent {
  const factory _ChangeTheme({required final AppTheme theme}) =
      _$ChangeThemeImpl;

  AppTheme get theme;

  /// Create a copy of SettingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingState {
  AppLanguage get language => throw _privateConstructorUsedError;
  AppTheme get theme => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call(
      {AppLanguage language,
      AppTheme theme,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  $AppLanguageCopyWith<$Res> get language;
  $AppThemeCopyWith<$Res> get theme;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as AppLanguage,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ) as $Val);
  }

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppLanguageCopyWith<$Res> get language {
    return $AppLanguageCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppThemeCopyWith<$Res> get theme {
    return $AppThemeCopyWith<$Res>(_value.theme, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingStateImplCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$SettingStateImplCopyWith(
          _$SettingStateImpl value, $Res Function(_$SettingStateImpl) then) =
      __$$SettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppLanguage language,
      AppTheme theme,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  @override
  $AppLanguageCopyWith<$Res> get language;
  @override
  $AppThemeCopyWith<$Res> get theme;
}

/// @nodoc
class __$$SettingStateImplCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$SettingStateImpl>
    implements _$$SettingStateImplCopyWith<$Res> {
  __$$SettingStateImplCopyWithImpl(
      _$SettingStateImpl _value, $Res Function(_$SettingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$SettingStateImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as AppLanguage,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SettingStateImpl implements _SettingState {
  const _$SettingStateImpl(
      {required this.language,
      required this.theme,
      required this.failureOrSuccessOption});

  @override
  final AppLanguage language;
  @override
  final AppTheme theme;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'SettingState(language: $language, theme: $theme, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingStateImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, language, theme, failureOrSuccessOption);

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      __$$SettingStateImplCopyWithImpl<_$SettingStateImpl>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {required final AppLanguage language,
      required final AppTheme theme,
      required final Option<Either<AppFailure, dynamic>>
          failureOrSuccessOption}) = _$SettingStateImpl;

  @override
  AppLanguage get language;
  @override
  AppTheme get theme;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
