import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/app/res/res.dart';

void main() {
  group('AppColors', () {
    const primaryColor = Colors.blue;
    const secondaryColor = Colors.red;
    const neutralColor = Colors.grey;
    const foregroundColor = Colors.white;
    const errorColor = Colors.redAccent;
    const backgroundColor = Colors.black;
    const successColor = Colors.green;
    const nameColor = Colors.orange;
    const yellowColor = Colors.yellow;
    const redColor = Colors.red;
    const blueColor = Colors.blue;
    const purpleColor = Colors.purple;
    const oliveColor = Colors.green;

    const appColors = AppColors(
      primary: primaryColor,
      secondary: secondaryColor,
      neutral: neutralColor,
      foreground: foregroundColor,
      error: errorColor,
      background: backgroundColor,
      success: successColor,
      nameColor: nameColor,
      yellow: yellowColor,
      redColor: redColor,
      blueColor: blueColor,
      purpleColor: purpleColor,
      oliveColor: oliveColor,
    );

    test('supports value equality', () {
      expect(
        appColors,
        const AppColors(
          primary: primaryColor,
          secondary: secondaryColor,
          neutral: neutralColor,
          foreground: foregroundColor,
          error: errorColor,
          background: backgroundColor,
          success: successColor,
          nameColor: nameColor,
          yellow: yellowColor,
          redColor: redColor,
          blueColor: blueColor,
          purpleColor: purpleColor,
          oliveColor: oliveColor,
        ),
      );
    });

    test('copyWith updates properties correctly', () {
      final updatedPrimaryColors = appColors.copyWith(primary: Colors.purple);

      expect(updatedPrimaryColors.primary, Colors.purple);

      final updatedSecondaryColors = appColors.copyWith(secondary: Colors.red);
      expect(updatedSecondaryColors.secondary, Colors.red);
    });

    test('lerp returns this when other is null', () {
      expect(appColors.lerp(null, 0.5), appColors);
    });

    // test('lerp works correctly with other AppColors', () {
    //   const otherAppColors = AppColors(
    //     primary: Colors.pink,
    //     secondary: Colors.yellow,
    //     neutral: Colors.brown,
    //     foreground: Colors.cyan,
    //     error: Colors.deepOrange,
    //     background: Colors.lime,
    //     success: Colors.teal,
    //   );
    //
    //   final lerpColors = appColors.lerp(otherAppColors, 0.5);
    //
    //   expect(lerpColors.primary, Color.lerp(primaryColor, Colors.pink, 0.5));
    //   expect(lerpColors.secondary, Color.lerp(secondaryColor, Colors.yellow, 0.5));
    //   expect(lerpColors.neutral, Color.lerp(neutralColor, Colors.brown, 0.5));
    //   expect(lerpColors.foreground, Color.lerp(foregroundColor, Colors.cyan, 0.5));
    //   expect(lerpColors.error, Color.lerp(errorColor, Colors.deepOrange, 0.5));
    //   expect(lerpColors.background, Color.lerp(backgroundColor, Colors.lime, 0.5));
    //   expect(lerpColors.success, Color.lerp(successColor, Colors.teal, 0.5));
    // });
  });
}
