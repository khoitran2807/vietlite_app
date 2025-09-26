// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ThingDto _$ThingDtoFromJson(Map<String, dynamic> json) {
  return _ThingDto.fromJson(json);
}

/// @nodoc
mixin _$ThingDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ThingExampleDto> get examples => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get order => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ThingExerciseDto> get exercises => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalExercises => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isPremium => throw _privateConstructorUsedError;

  /// Serializes this ThingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingDtoCopyWith<ThingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingDtoCopyWith<$Res> {
  factory $ThingDtoCopyWith(ThingDto value, $Res Function(ThingDto) then) =
      _$ThingDtoCopyWithImpl<$Res, ThingDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String name,
    @JsonKey(defaultValue: '') String audio,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: []) List<ThingExampleDto> examples,
    @JsonKey(defaultValue: 0) int order,
    @JsonKey(defaultValue: '') String type,
    @JsonKey(defaultValue: []) List<ThingExerciseDto> exercises,
    @JsonKey(defaultValue: 0) int totalExercises,
    @JsonKey(defaultValue: false) bool isPremium,
  });
}

/// @nodoc
class _$ThingDtoCopyWithImpl<$Res, $Val extends ThingDto>
    implements $ThingDtoCopyWith<$Res> {
  _$ThingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? audio = null,
    Object? image = null,
    Object? examples = null,
    Object? order = null,
    Object? type = null,
    Object? exercises = null,
    Object? totalExercises = null,
    Object? isPremium = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            audio:
                null == audio
                    ? _value.audio
                    : audio // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            examples:
                null == examples
                    ? _value.examples
                    : examples // ignore: cast_nullable_to_non_nullable
                        as List<ThingExampleDto>,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<ThingExerciseDto>,
            totalExercises:
                null == totalExercises
                    ? _value.totalExercises
                    : totalExercises // ignore: cast_nullable_to_non_nullable
                        as int,
            isPremium:
                null == isPremium
                    ? _value.isPremium
                    : isPremium // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThingDtoImplCopyWith<$Res>
    implements $ThingDtoCopyWith<$Res> {
  factory _$$ThingDtoImplCopyWith(
    _$ThingDtoImpl value,
    $Res Function(_$ThingDtoImpl) then,
  ) = __$$ThingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String name,
    @JsonKey(defaultValue: '') String audio,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: []) List<ThingExampleDto> examples,
    @JsonKey(defaultValue: 0) int order,
    @JsonKey(defaultValue: '') String type,
    @JsonKey(defaultValue: []) List<ThingExerciseDto> exercises,
    @JsonKey(defaultValue: 0) int totalExercises,
    @JsonKey(defaultValue: false) bool isPremium,
  });
}

/// @nodoc
class __$$ThingDtoImplCopyWithImpl<$Res>
    extends _$ThingDtoCopyWithImpl<$Res, _$ThingDtoImpl>
    implements _$$ThingDtoImplCopyWith<$Res> {
  __$$ThingDtoImplCopyWithImpl(
    _$ThingDtoImpl _value,
    $Res Function(_$ThingDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? audio = null,
    Object? image = null,
    Object? examples = null,
    Object? order = null,
    Object? type = null,
    Object? exercises = null,
    Object? totalExercises = null,
    Object? isPremium = null,
  }) {
    return _then(
      _$ThingDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        audio:
            null == audio
                ? _value.audio
                : audio // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        examples:
            null == examples
                ? _value._examples
                : examples // ignore: cast_nullable_to_non_nullable
                    as List<ThingExampleDto>,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<ThingExerciseDto>,
        totalExercises:
            null == totalExercises
                ? _value.totalExercises
                : totalExercises // ignore: cast_nullable_to_non_nullable
                    as int,
        isPremium:
            null == isPremium
                ? _value.isPremium
                : isPremium // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThingDtoImpl extends _ThingDto {
  const _$ThingDtoImpl({
    required this.id,
    @JsonKey(defaultValue: '') required this.name,
    @JsonKey(defaultValue: '') required this.audio,
    @JsonKey(defaultValue: '') required this.image,
    @JsonKey(defaultValue: []) required final List<ThingExampleDto> examples,
    @JsonKey(defaultValue: 0) required this.order,
    @JsonKey(defaultValue: '') required this.type,
    @JsonKey(defaultValue: []) required final List<ThingExerciseDto> exercises,
    @JsonKey(defaultValue: 0) required this.totalExercises,
    @JsonKey(defaultValue: false) required this.isPremium,
  }) : _examples = examples,
       _exercises = exercises,
       super._();

  factory _$ThingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThingDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String audio;
  @override
  @JsonKey(defaultValue: '')
  final String image;
  final List<ThingExampleDto> _examples;
  @override
  @JsonKey(defaultValue: [])
  List<ThingExampleDto> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  @JsonKey(defaultValue: 0)
  final int order;
  @override
  @JsonKey(defaultValue: '')
  final String type;
  final List<ThingExerciseDto> _exercises;
  @override
  @JsonKey(defaultValue: [])
  List<ThingExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey(defaultValue: 0)
  final int totalExercises;
  @override
  @JsonKey(defaultValue: false)
  final bool isPremium;

  @override
  String toString() {
    return 'ThingDto(id: $id, name: $name, audio: $audio, image: $image, examples: $examples, order: $order, type: $type, exercises: $exercises, totalExercises: $totalExercises, isPremium: $isPremium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    audio,
    image,
    const DeepCollectionEquality().hash(_examples),
    order,
    type,
    const DeepCollectionEquality().hash(_exercises),
    totalExercises,
    isPremium,
  );

  /// Create a copy of ThingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingDtoImplCopyWith<_$ThingDtoImpl> get copyWith =>
      __$$ThingDtoImplCopyWithImpl<_$ThingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThingDtoImplToJson(this);
  }
}

abstract class _ThingDto extends ThingDto {
  const factory _ThingDto({
    required final String id,
    @JsonKey(defaultValue: '') required final String name,
    @JsonKey(defaultValue: '') required final String audio,
    @JsonKey(defaultValue: '') required final String image,
    @JsonKey(defaultValue: []) required final List<ThingExampleDto> examples,
    @JsonKey(defaultValue: 0) required final int order,
    @JsonKey(defaultValue: '') required final String type,
    @JsonKey(defaultValue: []) required final List<ThingExerciseDto> exercises,
    @JsonKey(defaultValue: 0) required final int totalExercises,
    @JsonKey(defaultValue: false) required final bool isPremium,
  }) = _$ThingDtoImpl;
  const _ThingDto._() : super._();

  factory _ThingDto.fromJson(Map<String, dynamic> json) =
      _$ThingDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get audio;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: [])
  List<ThingExampleDto> get examples;
  @override
  @JsonKey(defaultValue: 0)
  int get order;
  @override
  @JsonKey(defaultValue: '')
  String get type;
  @override
  @JsonKey(defaultValue: [])
  List<ThingExerciseDto> get exercises;
  @override
  @JsonKey(defaultValue: 0)
  int get totalExercises;
  @override
  @JsonKey(defaultValue: false)
  bool get isPremium;

  /// Create a copy of ThingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingDtoImplCopyWith<_$ThingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThingExampleDto _$ThingExampleDtoFromJson(Map<String, dynamic> json) {
  return _ThingExampleDto.fromJson(json);
}

/// @nodoc
mixin _$ThingExampleDto {
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;

  /// Serializes this ThingExampleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThingExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingExampleDtoCopyWith<ThingExampleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingExampleDtoCopyWith<$Res> {
  factory $ThingExampleDtoCopyWith(
    ThingExampleDto value,
    $Res Function(ThingExampleDto) then,
  ) = _$ThingExampleDtoCopyWithImpl<$Res, ThingExampleDto>;
  @useResult
  $Res call({
    @JsonKey(defaultValue: '') String title,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: '') String audio,
  });
}

/// @nodoc
class _$ThingExampleDtoCopyWithImpl<$Res, $Val extends ThingExampleDto>
    implements $ThingExampleDtoCopyWith<$Res> {
  _$ThingExampleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingExampleDto
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
abstract class _$$ThingExampleDtoImplCopyWith<$Res>
    implements $ThingExampleDtoCopyWith<$Res> {
  factory _$$ThingExampleDtoImplCopyWith(
    _$ThingExampleDtoImpl value,
    $Res Function(_$ThingExampleDtoImpl) then,
  ) = __$$ThingExampleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(defaultValue: '') String title,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: '') String audio,
  });
}

/// @nodoc
class __$$ThingExampleDtoImplCopyWithImpl<$Res>
    extends _$ThingExampleDtoCopyWithImpl<$Res, _$ThingExampleDtoImpl>
    implements _$$ThingExampleDtoImplCopyWith<$Res> {
  __$$ThingExampleDtoImplCopyWithImpl(
    _$ThingExampleDtoImpl _value,
    $Res Function(_$ThingExampleDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(
      _$ThingExampleDtoImpl(
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
@JsonSerializable()
class _$ThingExampleDtoImpl extends _ThingExampleDto {
  const _$ThingExampleDtoImpl({
    @JsonKey(defaultValue: '') required this.title,
    @JsonKey(defaultValue: '') required this.image,
    @JsonKey(defaultValue: '') required this.audio,
  }) : super._();

  factory _$ThingExampleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThingExampleDtoImplFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String image;
  @override
  @JsonKey(defaultValue: '')
  final String audio;

  @override
  String toString() {
    return 'ThingExampleDto(title: $title, image: $image, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingExampleDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, audio);

  /// Create a copy of ThingExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingExampleDtoImplCopyWith<_$ThingExampleDtoImpl> get copyWith =>
      __$$ThingExampleDtoImplCopyWithImpl<_$ThingExampleDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ThingExampleDtoImplToJson(this);
  }
}

abstract class _ThingExampleDto extends ThingExampleDto {
  const factory _ThingExampleDto({
    @JsonKey(defaultValue: '') required final String title,
    @JsonKey(defaultValue: '') required final String image,
    @JsonKey(defaultValue: '') required final String audio,
  }) = _$ThingExampleDtoImpl;
  const _ThingExampleDto._() : super._();

  factory _ThingExampleDto.fromJson(Map<String, dynamic> json) =
      _$ThingExampleDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: '')
  String get audio;

  /// Create a copy of ThingExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingExampleDtoImplCopyWith<_$ThingExampleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThingExerciseDto _$ThingExerciseDtoFromJson(Map<String, dynamic> json) {
  return _ThingExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$ThingExerciseDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get choices => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get question => throw _privateConstructorUsedError;

  /// Serializes this ThingExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingExerciseDtoCopyWith<ThingExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingExerciseDtoCopyWith<$Res> {
  factory $ThingExerciseDtoCopyWith(
    ThingExerciseDto value,
    $Res Function(ThingExerciseDto) then,
  ) = _$ThingExerciseDtoCopyWithImpl<$Res, ThingExerciseDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String answer,
    @JsonKey(defaultValue: <String>[]) List<String> choices,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: '') String question,
  });
}

/// @nodoc
class _$ThingExerciseDtoCopyWithImpl<$Res, $Val extends ThingExerciseDto>
    implements $ThingExerciseDtoCopyWith<$Res> {
  _$ThingExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? image = null,
    Object? question = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            answer:
                null == answer
                    ? _value.answer
                    : answer // ignore: cast_nullable_to_non_nullable
                        as String,
            choices:
                null == choices
                    ? _value.choices
                    : choices // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            question:
                null == question
                    ? _value.question
                    : question // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThingExerciseDtoImplCopyWith<$Res>
    implements $ThingExerciseDtoCopyWith<$Res> {
  factory _$$ThingExerciseDtoImplCopyWith(
    _$ThingExerciseDtoImpl value,
    $Res Function(_$ThingExerciseDtoImpl) then,
  ) = __$$ThingExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String answer,
    @JsonKey(defaultValue: <String>[]) List<String> choices,
    @JsonKey(defaultValue: '') String image,
    @JsonKey(defaultValue: '') String question,
  });
}

/// @nodoc
class __$$ThingExerciseDtoImplCopyWithImpl<$Res>
    extends _$ThingExerciseDtoCopyWithImpl<$Res, _$ThingExerciseDtoImpl>
    implements _$$ThingExerciseDtoImplCopyWith<$Res> {
  __$$ThingExerciseDtoImplCopyWithImpl(
    _$ThingExerciseDtoImpl _value,
    $Res Function(_$ThingExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? image = null,
    Object? question = null,
  }) {
    return _then(
      _$ThingExerciseDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        answer:
            null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                    as String,
        choices:
            null == choices
                ? _value._choices
                : choices // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        question:
            null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThingExerciseDtoImpl extends _ThingExerciseDto {
  const _$ThingExerciseDtoImpl({
    required this.id,
    @JsonKey(defaultValue: '') required this.answer,
    @JsonKey(defaultValue: <String>[]) required final List<String> choices,
    @JsonKey(defaultValue: '') required this.image,
    @JsonKey(defaultValue: '') required this.question,
  }) : _choices = choices,
       super._();

  factory _$ThingExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThingExerciseDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String answer;
  final List<String> _choices;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  @JsonKey(defaultValue: '')
  final String image;
  @override
  @JsonKey(defaultValue: '')
  final String question;

  @override
  String toString() {
    return 'ThingExerciseDto(id: $id, answer: $answer, choices: $choices, image: $image, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    answer,
    const DeepCollectionEquality().hash(_choices),
    image,
    question,
  );

  /// Create a copy of ThingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingExerciseDtoImplCopyWith<_$ThingExerciseDtoImpl> get copyWith =>
      __$$ThingExerciseDtoImplCopyWithImpl<_$ThingExerciseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ThingExerciseDtoImplToJson(this);
  }
}

abstract class _ThingExerciseDto extends ThingExerciseDto {
  const factory _ThingExerciseDto({
    required final String id,
    @JsonKey(defaultValue: '') required final String answer,
    @JsonKey(defaultValue: <String>[]) required final List<String> choices,
    @JsonKey(defaultValue: '') required final String image,
    @JsonKey(defaultValue: '') required final String question,
  }) = _$ThingExerciseDtoImpl;
  const _ThingExerciseDto._() : super._();

  factory _ThingExerciseDto.fromJson(Map<String, dynamic> json) =
      _$ThingExerciseDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get answer;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get choices;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: '')
  String get question;

  /// Create a copy of ThingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingExerciseDtoImplCopyWith<_$ThingExerciseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
