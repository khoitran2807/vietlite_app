import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/common/extension/build_context.dart';

enum ThingType {
  color,
  fruit,
  animal,
  vehicle,
  shape,
  schoolSupply;

  String get image {
    switch (this) {
      case ThingType.color:
        return AppImages.color;
      case ThingType.fruit:
        return AppImages.fruit;
      case ThingType.animal:
        return AppImages.animal;
      case ThingType.vehicle:
        return AppImages.vehicle;
      case ThingType.shape:
        return AppImages.shape;
      case ThingType.schoolSupply:
        return AppImages.schoolSupply;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case ThingType.color:
        return context.lang.color;
      case ThingType.fruit:
        return context.lang.fruit;
      case ThingType.animal:
        return context.lang.animal;
      case ThingType.vehicle:
        return context.lang.vehicle;
      case ThingType.shape:
        return context.lang.shape;
      case ThingType.schoolSupply:
        return context.lang.schoolSupply;
    }
  }
}
