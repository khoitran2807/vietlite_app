// coverage:ignore-file
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:vietlite/common/value/value_failures.dart';
import 'package:vietlite/common/value/value_validators.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((failure) => left(failure), (_) => right(unit));
  }

  @override
  int get hashCode => value.hashCode;

  const ValueObject();

  T getValue() =>
      value.fold((failure) => failure.failedValue, (right) => right);

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  String toString() => 'Value($value)';
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      CoreValueValidators.validateStringNotEmpty(
        input,
      ).flatMap(CoreValueValidators.validateEmailAddress),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      CoreValueValidators.validateStringNotEmpty(
        input,
      ).flatMap(CoreValueValidators.validatePassword),
    );
  }

  const Password._(this.value);
}
