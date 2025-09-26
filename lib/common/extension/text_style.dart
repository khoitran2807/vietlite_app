import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  // TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get heavy => copyWith(fontWeight: FontWeight.w800);

  TextStyle get s12 => copyWith(fontSize: 12);

  // TextStyle get s14 => copyWith(fontSize: 14);

  TextStyle get s16 => copyWith(fontSize: 16);

  TextStyle get s20 => copyWith(fontSize: 20);

  TextStyle get s24 => copyWith(fontSize: 24);

  TextStyle get s44 => copyWith(fontSize: 44);
}
