import 'package:dartz/dartz.dart';
import 'package:vietlite/common/value/value_failures.dart';

class CoreValueValidators {
  static Either<ValueFailure<String>, String> validateStringNotEmpty(
    String input,
  ) {
    return input.trim().isNotEmpty
        ? right(input)
        : left(ValueFailure.empty(failedValue: input));
  }

  static Either<ValueFailure<String>, String> validateEmailAddress(
    String input,
  ) {
    const emailRegex =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    return RegExp(emailRegex).hasMatch(input)
        ? right(input)
        : left(ValueFailure.invalidEmail(failedValue: input));
  }

  static Either<ValueFailure<String>, String> validatePassword(String input) {
    if (input.length >= 6) {
      return right(input);
    } else {
      return left(ValueFailure.invalidPassword(failedValue: input));
    }
  }
}
