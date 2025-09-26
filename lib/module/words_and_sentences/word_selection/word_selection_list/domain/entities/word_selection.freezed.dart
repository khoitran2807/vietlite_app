// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WordSelection {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get totalExercises => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  List<WordSelectionExercise> get exercises =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionCopyWith<WordSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionCopyWith<$Res> {
  factory $WordSelectionCopyWith(
    WordSelection value,
    $Res Function(WordSelection) then,
  ) = _$WordSelectionCopyWithImpl<$Res, WordSelection>;
  @useResult
  $Res call({
    String id,
    String title,
    int totalExercises,
    int order,
    bool isPremium,
    List<WordSelectionExercise> exercises,
  });
}

/// @nodoc
class _$WordSelectionCopyWithImpl<$Res, $Val extends WordSelection>
    implements $WordSelectionCopyWith<$Res> {
  _$WordSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExercises = null,
    Object? order = null,
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
            totalExercises:
                null == totalExercises
                    ? _value.totalExercises
                    : totalExercises // ignore: cast_nullable_to_non_nullable
                        as int,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
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
                        as List<WordSelectionExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WordSelectionImplCopyWith<$Res>
    implements $WordSelectionCopyWith<$Res> {
  factory _$$WordSelectionImplCopyWith(
    _$WordSelectionImpl value,
    $Res Function(_$WordSelectionImpl) then,
  ) = __$$WordSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    int totalExercises,
    int order,
    bool isPremium,
    List<WordSelectionExercise> exercises,
  });
}

/// @nodoc
class __$$WordSelectionImplCopyWithImpl<$Res>
    extends _$WordSelectionCopyWithImpl<$Res, _$WordSelectionImpl>
    implements _$$WordSelectionImplCopyWith<$Res> {
  __$$WordSelectionImplCopyWithImpl(
    _$WordSelectionImpl _value,
    $Res Function(_$WordSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExercises = null,
    Object? order = null,
    Object? isPremium = null,
    Object? exercises = null,
  }) {
    return _then(
      _$WordSelectionImpl(
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
        totalExercises:
            null == totalExercises
                ? _value.totalExercises
                : totalExercises // ignore: cast_nullable_to_non_nullable
                    as int,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
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
                    as List<WordSelectionExercise>,
      ),
    );
  }
}

/// @nodoc

class _$WordSelectionImpl extends _WordSelection {
  const _$WordSelectionImpl({
    required this.id,
    required this.title,
    required this.totalExercises,
    required this.order,
    required this.isPremium,
    required final List<WordSelectionExercise> exercises,
  }) : _exercises = exercises,
       super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final int totalExercises;
  @override
  final int order;
  @override
  final bool isPremium;
  final List<WordSelectionExercise> _exercises;
  @override
  List<WordSelectionExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WordSelection(id: $id, title: $title, totalExercises: $totalExercises, order: $order, isPremium: $isPremium, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.order, order) || other.order == order) &&
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
    totalExercises,
    order,
    isPremium,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WordSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionImplCopyWith<_$WordSelectionImpl> get copyWith =>
      __$$WordSelectionImplCopyWithImpl<_$WordSelectionImpl>(this, _$identity);
}

abstract class _WordSelection extends WordSelection {
  const factory _WordSelection({
    required final String id,
    required final String title,
    required final int totalExercises,
    required final int order,
    required final bool isPremium,
    required final List<WordSelectionExercise> exercises,
  }) = _$WordSelectionImpl;
  const _WordSelection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  int get totalExercises;
  @override
  int get order;
  @override
  bool get isPremium;
  @override
  List<WordSelectionExercise> get exercises;

  /// Create a copy of WordSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionImplCopyWith<_$WordSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordSelectionExercise {
  String get id => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionExerciseCopyWith<WordSelectionExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionExerciseCopyWith<$Res> {
  factory $WordSelectionExerciseCopyWith(
    WordSelectionExercise value,
    $Res Function(WordSelectionExercise) then,
  ) = _$WordSelectionExerciseCopyWithImpl<$Res, WordSelectionExercise>;
  @useResult
  $Res call({String id, List<String> choices, String question, String answer});
}

/// @nodoc
class _$WordSelectionExerciseCopyWithImpl<
  $Res,
  $Val extends WordSelectionExercise
>
    implements $WordSelectionExerciseCopyWith<$Res> {
  _$WordSelectionExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? question = null,
    Object? answer = null,
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
            question:
                null == question
                    ? _value.question
                    : question // ignore: cast_nullable_to_non_nullable
                        as String,
            answer:
                null == answer
                    ? _value.answer
                    : answer // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WordSelectionExerciseImplCopyWith<$Res>
    implements $WordSelectionExerciseCopyWith<$Res> {
  factory _$$WordSelectionExerciseImplCopyWith(
    _$WordSelectionExerciseImpl value,
    $Res Function(_$WordSelectionExerciseImpl) then,
  ) = __$$WordSelectionExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<String> choices, String question, String answer});
}

/// @nodoc
class __$$WordSelectionExerciseImplCopyWithImpl<$Res>
    extends
        _$WordSelectionExerciseCopyWithImpl<$Res, _$WordSelectionExerciseImpl>
    implements _$$WordSelectionExerciseImplCopyWith<$Res> {
  __$$WordSelectionExerciseImplCopyWithImpl(
    _$WordSelectionExerciseImpl _value,
    $Res Function(_$WordSelectionExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordSelectionExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(
      _$WordSelectionExerciseImpl(
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
        question:
            null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                    as String,
        answer:
            null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$WordSelectionExerciseImpl extends _WordSelectionExercise {
  const _$WordSelectionExerciseImpl({
    required this.id,
    required final List<String> choices,
    required this.question,
    required this.answer,
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
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'WordSelectionExercise(id: $id, choices: $choices, question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_choices),
    question,
    answer,
  );

  /// Create a copy of WordSelectionExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionExerciseImplCopyWith<_$WordSelectionExerciseImpl>
  get copyWith =>
      __$$WordSelectionExerciseImplCopyWithImpl<_$WordSelectionExerciseImpl>(
        this,
        _$identity,
      );
}

abstract class _WordSelectionExercise extends WordSelectionExercise {
  const factory _WordSelectionExercise({
    required final String id,
    required final List<String> choices,
    required final String question,
    required final String answer,
  }) = _$WordSelectionExerciseImpl;
  const _WordSelectionExercise._() : super._();

  @override
  String get id;
  @override
  List<String> get choices;
  @override
  String get question;
  @override
  String get answer;

  /// Create a copy of WordSelectionExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionExerciseImplCopyWith<_$WordSelectionExerciseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
