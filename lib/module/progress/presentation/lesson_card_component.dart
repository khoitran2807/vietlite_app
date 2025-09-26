import 'package:flutter/material.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';

class LessonCardComponent extends StatelessWidget {
  final VoidCallback onTap;
  final MaterialColor color;
  final String title;
  final String content;

  const LessonCardComponent({
    super.key,
    required this.onTap,
    required this.color,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.s8),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.s8),
        decoration: BoxDecoration(
          color: color.shade100,
          borderRadius: BorderRadius.circular(AppDimensions.s8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.defaultStyle.semiBold),
            Text(
              content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.defaultStyle.s20.semiBold.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
