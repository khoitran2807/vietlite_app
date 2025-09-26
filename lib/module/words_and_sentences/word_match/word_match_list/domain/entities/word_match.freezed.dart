// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WordMatch {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  int get totalExercises => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  List<WordMatchExercise> get exercises => throw _privateConstructorUsedError;

  /// Create a copy of WordMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchCopyWith<WordMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchCopyWith<$Res> {
  factory $WordMatchCopyWith(WordMatch value, $Res Function(WordMatch) then) =
      _$WordMatchCopyWithImpl<$Res, WordMatch>;
  @useResult
  $Res call({
    String id,
    String title,
    int order,
    int totalExercises,
    bool isPremium,
    List<WordMatchExercise> exercises,
  });
}

/// @nodoc
class _$WordMatchCopyWithImpl<$Res, $Val extends WordMatch>
    implements $WordMatchCopyWith<$Res> {
  _$WordMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? totalExercises = null,
    Object? isPremium = null,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int,
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
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<WordMatchExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WordMatchImplCopyWith<$Res>
    implements $WordMatchCopyWith<$Res> {
  factory _$$WordMatchImplCopyWith(
    _$WordMatchImpl value,
    $Res Function(_$WordMatchImpl) then,
  ) = __$$WordMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    int order,
    int totalExercises,
    bool isPremium,
    List<WordMatchExercise> exercises,
  });
}

/// @nodoc
class __$$WordMatchImplCopyWithImpl<$Res>
    extends _$WordMatchCopyWithImpl<$Res, _$WordMatchImpl>
    implements _$$WordMatchImplCopyWith<$Res> {
  __$$WordMatchImplCopyWithImpl(
    _$WordMatchImpl _value,
    $Res Function(_$WordMatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? totalExercises = null,
    Object? isPremium = null,
    Object? exercises = null,
  }) {
    return _then(
      _$WordMatchImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int,
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
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<WordMatchExercise>,
      ),
    );
  }
}

/// @nodoc

class _$WordMatchImpl extends _WordMatch {
  const _$WordMatchImpl({
    required this.id,
    required this.title,
    required this.order,
    required this.totalExercises,
    required this.isPremium,
    required final List<WordMatchExercise> exercises,
  }) : _exercises = exercises,
       super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final int order;
  @override
  final int totalExercises;
  @override
  final bool isPremium;
  final List<WordMatchExercise> _exercises;
  @override
  List<WordMatchExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WordMatch(id: $id, title: $title, order: $order, totalExercises: $totalExercises, isPremium: $isPremium, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    order,
    totalExercises,
    isPremium,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WordMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMatchImplCopyWith<_$WordMatchImpl> get copyWith =>
      __$$WordMatchImplCopyWithImpl<_$WordMatchImpl>(this, _$identity);
}

abstract class _WordMatch extends WordMatch {
  const factory _WordMatch({
    required final String id,
    required final String title,
    required final int order,
    required final int totalExercises,
    required final bool isPremium,
    required final List<WordMatchExercise> exercises,
  }) = _$WordMatchImpl;
  const _WordMatch._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  int get order;
  @override
  int get totalExercises;
  @override
  bool get isPremium;
  @override
  List<WordMatchExercise> get exercises;

  /// Create a copy of WordMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMatchImplCopyWith<_$WordMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordMatchExercise {
  String get id => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Create a copy of WordMatchExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchExerciseCopyWith<WordMatchExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchExerciseCopyWith<$Res> {
  factory $WordMatchExerciseCopyWith(
    WordMatchExercise value,
    $Res Function(WordMatchExercise) then,
  ) = _$WordMatchExerciseCopyWithImpl<$Res, WordMatchExercise>;
  @useResult
  $Res call({String id, List<String> choices, String answer, String image});
}

/// @nodoc
class _$WordMatchExerciseCopyWithImpl<$Res, $Val extends WordMatchExercise>
    implements $WordMatchExerciseCopyWith<$Res> {
  _$WordMatchExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatchExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? answer = null,
    Object? image = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            choices:
                null == choices
                    ? _value.choices
                    : choices // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            answer:
                null == answer
                    ? _value.answer
                    : answer // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WordMatchExerciseImplCopyWith<$Res>
    implements $WordMatchExerciseCopyWith<$Res> {
  factory _$$WordMatchExerciseImplCopyWith(
    _$WordMatchExerciseImpl value,
    $Res Function(_$WordMatchExerciseImpl) then,
  ) = __$$WordMatchExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<String> choices, String answer, String image});
}

/// @nodoc
class __$$WordMatchExerciseImplCopyWithImpl<$Res>
    extends _$WordMatchExerciseCopyWithImpl<$Res, _$WordMatchExerciseImpl>
    implements _$$WordMatchExerciseImplCopyWith<$Res> {
  __$$WordMatchExerciseImplCopyWithImpl(
    _$WordMatchExerciseImpl _value,
    $Res Function(_$WordMatchExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordMatchExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? answer = null,
    Object? image = null,
  }) {
    return _then(
      _$WordMatchExerciseImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        choices:
            null == choices
                ? _value._choices
                : choices // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        answer:
            null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$WordMatchExerciseImpl extends _WordMatchExercise {
  const _$WordMatchExerciseImpl({
    required this.id,
    required final List<String> choices,
    required this.answer,
    required this.image,
  }) : _choices = choices,
       super._();

  @override
  final String id;
  final List<String> _choices;
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final String answer;
  @override
  final String image;

  @override
  String toString() {
    return 'WordMatchExercise(id: $id, choices: $choices, answer: $answer, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMatchExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_choices),
    answer,
    image,
  );

  /// Create a copy of WordMatchExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMatchExerciseImplCopyWith<_$WordMatchExerciseImpl> get copyWith =>
      __$$WordMatchExerciseImplCopyWithImpl<_$WordMatchExerciseImpl>(
        this,
        _$identity,
      );
}

abstract class _WordMatchExercise extends WordMatchExercise {
  const factory _WordMatchExercise({
    required final String id,
    required final List<String> choices,
    required final String answer,
    required final String image,
  }) = _$WordMatchExerciseImpl;
  const _WordMatchExercise._() : super._();

  @override
  String get id;
  @override
  List<String> get choices;
  @override
  String get answer;
  @override
  String get image;

  /// Create a copy of WordMatchExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMatchExerciseImplCopyWith<_$WordMatchExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
