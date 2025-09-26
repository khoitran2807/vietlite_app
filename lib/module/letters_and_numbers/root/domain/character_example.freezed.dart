// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CharacterExample {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;

  /// Create a copy of CharacterExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterExampleCopyWith<CharacterExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterExampleCopyWith<$Res> {
  factory $CharacterExampleCopyWith(
    CharacterExample value,
    $Res Function(CharacterExample) then,
  ) = _$CharacterExampleCopyWithImpl<$Res, CharacterExample>;
  @useResult
  $Res call({String title, String image, String audio});
}

/// @nodoc
class _$CharacterExampleCopyWithImpl<$Res, $Val extends CharacterExample>
    implements $CharacterExampleCopyWith<$Res> {
  _$CharacterExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            audio:
                null == audio
                    ? _value.audio
                    : audio // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CharacterExampleImplCopyWith<$Res>
    implements $CharacterExampleCopyWith<$Res> {
  factory _$$CharacterExampleImplCopyWith(
    _$CharacterExampleImpl value,
    $Res Function(_$CharacterExampleImpl) then,
  ) = __$$CharacterExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String image, String audio});
}

/// @nodoc
class __$$CharacterExampleImplCopyWithImpl<$Res>
    extends _$CharacterExampleCopyWithImpl<$Res, _$CharacterExampleImpl>
    implements _$$CharacterExampleImplCopyWith<$Res> {
  __$$CharacterExampleImplCopyWithImpl(
    _$CharacterExampleImpl _value,
    $Res Function(_$CharacterExampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(
      _$CharacterExampleImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        audio:
            null == audio
                ? _value.audio
                : audio // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$CharacterExampleImpl extends _CharacterExample {
  const _$CharacterExampleImpl({
    required this.title,
    required this.image,
    required this.audio,
  }) : super._();

  @override
  final String title;
  @override
  final String image;
  @override
  final String audio;

  @override
  String toString() {
    return 'CharacterExample(title: $title, image: $image, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterExampleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, image, audio);

  /// Create a copy of CharacterExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterExampleImplCopyWith<_$CharacterExampleImpl> get copyWith =>
      __$$CharacterExampleImplCopyWithImpl<_$CharacterExampleImpl>(
        this,
        _$identity,
      );
}

abstract class _CharacterExample extends CharacterExample {
  const factory _CharacterExample({
    required final String title,
    required final String image,
    required final String audio,
  }) = _$CharacterExampleImpl;
  const _CharacterExample._() : super._();

  @override
  String get title;
  @override
  String get image;
  @override
  String get audio;

  /// Create a copy of CharacterExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterExampleImplCopyWith<_$CharacterExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
