import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/module/home/presentation/widget/home_grid.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/root/presentation/widget/header_info.dart';
import 'package:vietlite/app/res/dimensions.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (!context.isTablet)
            ? Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.s16,
                right: AppDimensions.s16,
                top: AppDimensions.s36,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.s16),
                  color: context.color.foreground,
                  border: Border.all(
                    color: context.color.neutral.shade200,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.s16,
                    vertical: AppDimensions.s8,
                  ),
                  child: const HeaderInfo(),
                ),
              ),
            )
            : const SizedBox(),
        if (!context.isWebsite)
          Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.s16,
              right: AppDimensions.s16,
            ),
            child: const ProgressComponent(),
          ),
        const Expanded(child: HomeGrid()),
      ],
    );
  }
}
