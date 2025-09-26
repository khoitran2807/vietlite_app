import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/build_context.dart';

class Tag extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  const Tag({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? context.color.neutral.shade200,
            width: 1,
          ),
          color: color ?? context.color.foreground,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Center(child: child),
      ),
    );
  }
}
