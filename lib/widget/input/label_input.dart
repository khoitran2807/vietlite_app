import 'package:flutter/material.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'input.dart';
import 'input_type.dart';

class LabelInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  final bool isEnable;
  final bool isRequired;
  final bool obscure;
  final int maxLine;
  final ValueChanged<String>? onFieldSubmitted;

  LabelInput({
    super.key,
    required this.label,
    required this.controller,
    inputType,
    this.isEnable = true,
    this.isRequired = true,
    this.obscure = false,
    this.maxLine = 1,
    this.onFieldSubmitted,
  }) : inputType = inputType ?? InputType.text();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: context.defaultStyle.semiBold),
            (isRequired)
                ? Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('*', style: context.defaultStyle),
                )
                : const SizedBox(),
          ],
        ),
        SizedBox(height: AppDimensions.s4),
        Input.raw(
          fieldKey: UniqueKey(),
          controller: controller,
          autofocus: false,
          inputType: inputType,
          isEnable: isEnable,
          obscure: obscure,
          maxLine: maxLine,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
