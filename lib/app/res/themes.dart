import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';
import 'icons.dart';

ThemeData get lightTheme {
  MaterialColor primaryColor = const MaterialColor(0xFFEC8D00, {
    100: Color(0xFFFFF6D7),
  });

  MaterialColor secondaryColor = const MaterialColor(0xFF31AD62, {
    100: Color(0xFFE5F6EA),
  });

  MaterialColor neutralColor = const MaterialColor(
    0xFF000000, // primary text color
    {
      100: Color(0xFF7D7D7D), // disabledColor
      200: Color(0xFFD4D6D9), // borderColor
      300: Color(0xFFF1F1F2),
      400: Color(0xFF606060), // lighter text color
    },
  );
  MaterialColor yellowColor = const MaterialColor(0xFFFFDB5D, {
    100: Color(0xFFFFFCE1),
  });
  Color foregroundColor = Colors.white;
  Color errorColor = const Color(0xFFFF4C4C);
  Color successColor = const Color(0xFF00E979);
  Color backgroundColor = const Color(0xFFf2f5f9);
  MaterialColor nameColor = const MaterialColor(0xFFB85C18, {
    100: Color(0xFFEC5500),
  });
  MaterialColor redColor = const MaterialColor(0xFFE96565, {
    100: Color(0xFFFCEEEE),
  });
  MaterialColor blueColor = const MaterialColor(0xFF09457D, {
    100: Color(0xFFE4FDFF),
  });
  MaterialColor purpleColor = const MaterialColor(0xFFB665E9, {
    100: Color(0xFFF3E4FF),
  });
  MaterialColor oliveColor = const MaterialColor(0xFF5F8522, {
    100: Color(0xFFF0F6D5),
  });
  return ThemeData(
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        primary: primaryColor,
        secondary: secondaryColor,
        neutral: neutralColor,
        foreground: foregroundColor,
        error: errorColor,
        background: backgroundColor,
        nameColor: nameColor,
        success: successColor,
        yellow: yellowColor,
        redColor: redColor,
        blueColor: blueColor,
        purpleColor: purpleColor,
        oliveColor: oliveColor,
      ),
    ],
    brightness: Brightness.light,
    fontFamily: 'SF Pro Display',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: neutralColor,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder:
          (BuildContext context) => SvgPicture.asset(AppIcons.back),
    ),
  );
}

ThemeData get darkTheme {
  MaterialColor primaryColor = const MaterialColor(0xFFEC8D00, {
    100: Color(0xFFFFF6D7),
  });

  MaterialColor secondaryColor = const MaterialColor(0xFF31AD62, {
    100: Color(0xFFE5F6EA),
  }); // Slightly desaturated secondary
  MaterialColor neutralColor = const MaterialColor(
    0xFFf5f5f5, // Lighter neutral for dark background
    {
      50: Color(0xFFf2f2f2),
      100: Color(0xFFe5e5e5),
      200: Color(0xFFcccccc),
      300: Color(0xFFb3b3b3),
      400: Color(0xFF999999),
      600: Color(0xFF666666),
      700: Color(0xFF4d4d4d),
    },
  );
  MaterialColor yellowColor = const MaterialColor(0xFFFFDB5D, {
    100: Color(0xFFFFFCE1),
  });
  Color foregroundColor = Colors.white; // White for dark theme foreground
  Color errorColor = const Color(0xFFFF4C4C); // Keep error color strong
  Color successColor = const Color(0xFF00E979); // Keep success color
  Color backgroundColor = const Color(0xFF121212); // Dark background
  MaterialColor nameColor = const MaterialColor(0xFFB85C18, {
    100: Color(0xFFEC5500),
  });
  MaterialColor redColor = const MaterialColor(0xFFE96565, {
    100: Color(0xFFFCEEEE),
  });
  MaterialColor blueColor = const MaterialColor(0xFF09457D, {
    100: Color(0xFFE4FDFF),
  });
  MaterialColor purpleColor = const MaterialColor(0xFFB665E9, {
    100: Color(0xFFF3E4FF),
  });
  MaterialColor oliveColor = const MaterialColor(0xFF5F8522, {
    100: Color(0xFFF0F6D5),
  });
  return ThemeData(
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        primary: primaryColor,
        secondary: secondaryColor,
        neutral: neutralColor,
        foreground: foregroundColor,
        // Renamed and adapted for dark theme
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
    ],
    brightness: Brightness.dark,
    fontFamily: 'SF Pro Display',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: neutralColor, // Lighter text for dark theme
        fontSize: 14,
        letterSpacing: 0.25,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder:
          (BuildContext context) => SvgPicture.asset(AppIcons.back),
    ),
  );
}
