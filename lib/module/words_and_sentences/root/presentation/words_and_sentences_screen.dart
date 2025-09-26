import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/tag.dart';
import 'package:vietlite/di/locator.shorten.dart';

@RoutePage()
class WordsAndSentencesScreen extends StatelessWidget {
  const WordsAndSentencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: (context.isTablet) ? '' : context.lang.wordsAndSentences,
      autoImplyLeading: false,
      child: Column(
        children: [
          (!context.isTablet)
              ? BlocBuilder<TabViewBloc, TabViewState>(
                buildWhen:
                    (previous, current) =>
                        previous.selectedChildTab != current.selectedChildTab,
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: AppDimensions.s16,
                      right: AppDimensions.s16,
                      top: AppDimensions.s16,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          child: Row(
                            children: [
                              ...NavItem.wordsNSentences.children.map(
                                (item) => Padding(
                                  padding: EdgeInsets.only(
                                    right: AppDimensions.s8,
                                  ),
                                  child: Tag(
                                    onTap: () {
                                      AppLocator.router.push(item.route);
                                      context.read<TabViewBloc>().add(
                                        TabViewEvent.changeChildTab(
                                          childItem: item,
                                        ),
                                      );
                                    },
                                    color:
                                        (state.selectedChildTab == item)
                                            ? context.color.secondary.shade100
                                            : context.color.foreground,
                                    borderColor:
                                        (state.selectedChildTab == item)
                                            ? context.color.secondary
                                            : context.color.neutral.shade200,
                                    child: Row(
                                      children: [
                                        if (state.selectedChildTab == item)
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: AppDimensions.s4,
                                            ),
                                            child: Icon(
                                              Icons.check_circle,
                                              color: context.color.secondary,
                                            ),
                                          ),
                                        Text(
                                          item.label(context),
                                          style: context.defaultStyle.copyWith(
                                            color:
                                                (state.selectedChildTab == item)
                                                    ? context.color.secondary
                                                    : context
                                                        .color
                                                        .neutral
                                                        .shade400,
                                          ),
                                        ),
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
                },
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
          const Expanded(child: AutoRouter()),
        ],
      ),
    );
  }
}
