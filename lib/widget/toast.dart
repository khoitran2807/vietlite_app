import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/extension.dart';

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message, style: context.defaultStyle.semiBold),
      width: 400,
      behavior: SnackBarBehavior.floating,
      backgroundColor: context.color.neutral.shade300,
      elevation: 4,
      duration: const Duration(seconds: 2),
    ),
  );
}
