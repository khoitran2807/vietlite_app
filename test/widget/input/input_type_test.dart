import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/input/input_type.dart';

void main() {
  group('InputType Tests', () {
    test('InputType.phone validator returns null for valid phone number', () {
      final inputType = InputType.phone();
      final result = inputType.validator?.call('0123456789');
      expect(result, isNull); // Expect no error message for valid input
    });

    test(
      'InputType.phone validator returns error for invalid phone number',
      () {
        final inputType = InputType.phone();
        final result = inputType.validator?.call(
          '123456789',
        ); // Invalid (too short)
        expect(result, equals('Số điện thoại có 10 số và bắt đầu bằng 0'));

        final result2 = inputType.validator?.call(
          '12345678901',
        ); // Invalid (too long)
        expect(result2, equals('Số điện thoại có 10 số và bắt đầu bằng 0'));

        final result3 = inputType.validator?.call(
          '1234567890',
        ); // Invalid (does not start with 0)
        expect(result3, equals('Số điện thoại có 10 số và bắt đầu bằng 0'));
      },
    );

    test('InputType.email validator returns error for empty email', () {
      final inputType = InputType.email();
      final result = inputType.validator?.call('');
      expect(result, equals('Email cannot be empty.'));
    });

    test('InputType.email validator returns null for valid email', () {
      final inputType = InputType.email();
      final result = inputType.validator?.call('test@example.com');
      expect(result, isNull); // Expect no error message for valid input
    });

    test('InputType.email validator returns error for invalid email', () {
      final inputType = InputType.email();
      final result = inputType.validator?.call(
        'invalid-email',
      ); // Invalid email
      expect(result, equals('Email is not in correct format'));
    });

    test('InputType.password validator returns null for valid password', () {
      final inputType = InputType.password();
      final result = inputType.validator?.call('123456'); // Valid password
      expect(result, isNull); // Expect no error message for valid input
    });

    test('InputType.password validator returns error for empty password', () {
      final inputType = InputType.password();
      final result = inputType.validator?.call(''); // Valid password
      expect(result, equals('Password cannot be empty.'));
    });

    test('InputType.password validator returns error for short password', () {
      final inputType = InputType.password();
      final result = inputType.validator?.call('123'); // Valid password
      expect(
        result,
        equals('Password must be at least 6 character'),
      ); // Expect no error message for valid input
    });

    test(
      'InputType.rePassword validator returns error for mismatched password',
      () {
        final passwordController = TextEditingController(text: '123456');
        final inputType = InputType.rePassword(passwordController);
        final result = inputType.validator?.call(
          '654321',
        ); // Mismatched password
        expect(result, equals('Mật khẩu không khớp'));
      },
    );

    test(
      'InputType.rePassword validator returns null for matching password',
      () {
        final passwordController = TextEditingController(text: '123456');
        final inputType = InputType.rePassword(passwordController);
        final result = inputType.validator?.call('123456'); // Matching password
        expect(result, isNull); // Expect no error message for valid input
      },
    );

    test('InputType.text validator returns error for empty input', () {
      final inputType = InputType.text();
      final result = inputType.validator?.call(''); // Empty input
      expect(result, equals('Trường này không được bỏ trống'));
    });

    test('InputType.number validator returns null for valid number', () {
      final inputType = InputType.number();
      final result = inputType.validator?.call('12345'); // Valid number
      expect(result, isNull); // Expect no error message for valid input
    });

    test('InputType.double validator returns null for valid double', () {
      final inputType = InputType.double();
      final result = inputType.validator?.call('123.45'); // Valid double
      expect(result, isNull); // Expect no error message for valid input
    });
  });
}
