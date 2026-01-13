import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/common/extension/build_context.dart';

enum ThingType {
  color,
  vietnameseFood,
  animal,
  vehicle,
  occupation,
  weather;

  String get image {
    switch (this) {
      case ThingType.color:
        return AppImages.color;
      case ThingType.vietnameseFood:
        return AppImages.vietnameseFood;
      case ThingType.animal:
        return AppImages.animal;
      case ThingType.vehicle:
        return AppImages.vehicle;
      case ThingType.occupation:
        return AppImages.occupation;
      case ThingType.weather:
        return AppImages.weather;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case ThingType.color:
        return context.lang.color;
      case ThingType.vietnameseFood:
        return context.lang.vietnameseFood;
      case ThingType.animal:
        return context.lang.animal;
      case ThingType.vehicle:
        return context.lang.vehicle;
      case ThingType.occupation:
        return context.lang.occupation;
      case ThingType.weather:
        return context.lang.weather;
    }
  }
}
