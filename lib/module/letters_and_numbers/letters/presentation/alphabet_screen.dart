import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/widget/app_scaffold.dart';

@RoutePage()
class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.lang.alphabet,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: AppDimensions.s16),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(AppImages.alphabet, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
