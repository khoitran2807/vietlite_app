import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/extension.dart';

class CardColors {
  static List<MaterialColor> list(BuildContext context) {
    return [
      context.color.redColor,
      context.color.primary,
      context.color.blueColor,
      context.color.secondary,
      context.color.purpleColor,
      context.color.oliveColor,
    ];
  }
}
