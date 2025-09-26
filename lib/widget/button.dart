import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/extension.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final double paddingVertical;
  final double paddingHorizontal;
  final double? borderRadius;
  final String buttonName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? borderSide;

  const Button.raw({
    super.key,
    required this.buttonName,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.borderRadius,
    required this.paddingVertical,
    required this.paddingHorizontal,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSide,
  });

  factory Button.primary({
    required String buttonName,
    Key? key,
    double? padding,
    double? paddingHorizontal,
    double? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onPressed,
  }) => Button.raw(
    key: key,
    paddingVertical: padding ?? 8,
    paddingHorizontal: paddingHorizontal ?? 16,
    borderRadius: borderRadius ?? 8,
    onPressed: onPressed,
    buttonName: buttonName,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );

  factory Button.secondary({
    required String buttonName,
    Key? key,
    double? padding,
    double? paddingHorizontal,
    double? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderSide? borderSide,
  }) => Button.raw(
    key: key,
    paddingVertical: padding ?? 8,
    paddingHorizontal: paddingHorizontal ?? 16,
    borderRadius: borderRadius ?? 8,
    onPressed: onPressed,
    buttonName: buttonName,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    borderSide: borderSide,
  );

  factory Button.disabled({required String buttonName, Key? key}) => Button.raw(
    key: key,
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderRadius: 8,
    onPressed: null,
    buttonName: buttonName,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>(
          // As you said you dont need elevation. I'm returning 0 in both case
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return 0;
            }
            return 0; // Defer to the widget's default.
          },
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: context.color.neutral.shade200,
              width: 1.0,
            ); // Display border in disabled state
          }
          return null; // No border in active state
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.foreground;
          }
          return backgroundColor ?? context.color.primary;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.defaultStyle;
          }
          return context.defaultStyle.semiBold;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.neutral.shade200; // Disabled state color
          }
          return foregroundColor ??
              context.color.foreground; // Active state color
        }),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: prefixIcon,
            ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (suffixIcon != null)
            Padding(padding: const EdgeInsets.only(left: 8), child: suffixIcon),
        ],
      ),
    );
  }
}
