import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';

class MobileBottomBar extends StatelessWidget {
  const MobileBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.bottomBarHeight,
      child: BlocBuilder<TabViewBloc, TabViewState>(
        buildWhen:
            (previous, current) =>
                previous.selectedTab != current.selectedTab ||
                previous.tabs != current.tabs,
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.s16),
                topRight: Radius.circular(AppDimensions.s16),
              ),
              border: Border.all(color: context.color.neutral.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...state.tabs.map(
                  (item) => Expanded(
                    child: InkWell(
                      onTap: () {
                        AppLocator.router.navigate(item.route);
                        context.read<TabViewBloc>().add(
                          TabViewEvent.changeTab(item: item),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            (item == state.selectedTab)
                                ? item.activeIcon
                                : item.icon,
                            height: item.size,
                            width: item.size,
                          ),
                          SizedBox(height: item.labelPadding),
                          Text(
                            item.shortLabel(context),
                            maxLines: 1,
                            style: context.defaultStyle.s12.copyWith(
                              color:
                                  (item == state.selectedTab)
                                      ? context.color.primary
                                      : context.color.neutral.shade400,
                            ),
                          ),
                          SizedBox(height: AppDimensions.s8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
