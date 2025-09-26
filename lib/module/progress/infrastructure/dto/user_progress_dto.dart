import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
part 'user_progress_dto.freezed.dart';
part 'user_progress_dto.g.dart';

@freezed
class UserProgressDto with _$UserProgressDto {
  const UserProgressDto._();

  const factory UserProgressDto({
    required String id,
    @JsonKey(fromJson: timeConvert, defaultValue: null)
    required DateTime? writeAt,
    @JsonKey(defaultValue: []) required List<UserExerciseDto> exercises,
    @JsonKey(defaultValue: ExerciseType.other)
    required ExerciseType exerciseType,
  }) = _UserProgressDto;

  factory UserProgressDto.fromJson(Map<String, dynamic> json) =>
      _$UserProgressDtoFromJson(json);

  /// Convert DTO to Domain Entity
  UserProgress get toDomain {
    return UserProgress(
      id: id,
      writeAt: writeAt,
      exercises: exercises.map((e) => e.toDomain).toList(),
      exerciseType: exerciseType,
    );
  }
}

DateTime? timeConvert(dynamic timestamp) {
  if (timestamp == null) return null;
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  } else if (timestamp is String) {
    return DateTime.tryParse(timestamp);
  }
  return null;
}

@freezed
class UserExerciseDto with _$UserExerciseDto {
  const UserExerciseDto._();

  const factory UserExerciseDto({
    required String id,
    @JsonKey(defaultValue: '') required String lastAnswer,
    @JsonKey(defaultValue: false) required bool isCorrect,
  }) = _UserExerciseDto;

  factory UserExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$UserExerciseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  UserExercise get toDomain {
    return UserExercise(id: id, lastAnswer: lastAnswer, isCorrect: isCorrect);
  }
}
