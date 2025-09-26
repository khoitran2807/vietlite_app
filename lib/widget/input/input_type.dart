import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vietlite/common/value/value_objects.dart';

class InputType {
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  InputType({
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.validator,
  });

  factory InputType.phone() {
    return InputType(
      maxLines: 1,
      maxLength: 10,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.length < 10 || !value.startsWith('0')) {
          return 'Số điện thoại có 10 số và bắt đầu bằng 0';
        }
        return null;
      },
    );
  }

  factory InputType.number() {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Trường này không được bỏ trống';
        }
        return null;
      },
    );
  }

  factory InputType.double() {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
      ],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Trường này không được bỏ trống';
        }
        return null;
      },
    );
  }

  factory InputType.password() {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.visiblePassword,
      validator:
          (value) => Password(value ?? '').value.fold(
            (failure) => failure.maybeMap(
              empty: (_) => 'Password cannot be empty.',
              orElse: () => 'Password must be at least 6 character',
            ),
            (_) => null,
          ),
    );
  }

  factory InputType.rePassword(TextEditingController data) {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Trường này không được bỏ trống';
        } else if (value != data.text) {
          return 'Mật khẩu không khớp';
        }
        return null;
      },
    );
  }

  factory InputType.text() {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Trường này không được bỏ trống';
        }
        return null;
      },
    );
  }

  factory InputType.email() {
    return InputType(
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      maxLength: 256,
      validator:
          (value) => EmailAddress(value ?? '').value.fold(
            (failure) => failure.maybeMap(
              empty: (_) => 'Email cannot be empty.',
              orElse: () => 'Email is not in correct format',
            ),
            (_) => null,
          ),
    );
  }
}
