import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/lesson_card_component.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';

class HomeProgressComponent extends StatelessWidget {
  const HomeProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final TabViewBloc tabViewBloc = context.read<TabViewBloc>();
    final bool isTablet = context.isTablet;
    return BlocBuilder<ProgressBloc, ProgressState>(
      buildWhen:
          (previous, current) =>
              previous.userProgresses != current.userProgresses,
      builder: (context, progressState) {
        if (progressState.userProgresses.isEmpty) {
          return const SizedBox();
        }
        return Padding(
          padding: EdgeInsets.only(top: AppDimensions.s16),
          child:
              (context.isWebsite)
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LessonCardComponent(
                        title: context.lang.letters,
                        content:
                            '${progressState.letterProgresses.length}/${AppLocator.remoteConfig.letters}',
                        color: context.color.primary,
                        onTap: () async {
                          await AppLocator.router.navigate(
                            const LettersScreenRoute(),
                          );
                          tabViewBloc.add(
                            TabViewEvent.initialize(
                              isTablet: isTablet,
                              routeName: AppLocator.router.currentPath,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimensions.s16),
                      LessonCardComponent(
                        title: context.lang.numbers,
                        content:
                            '${progressState.numberProgresses.length}/${AppLocator.remoteConfig.numbers}',
                        color: context.color.secondary,
                        onTap: () async {
                          await AppLocator.router.navigate(
                            const NumbersScreenRoute(),
                          );
                          tabViewBloc.add(
                            TabViewEvent.initialize(
                              isTablet: isTablet,
                              routeName: AppLocator.router.currentPath,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimensions.s16),
                      LessonCardComponent(
                        title: context.lang.wordsAndSentences,
                        content:
                            '${progressState.totalWordNSentenceProgress}/${AppLocator.remoteConfig.wordNSentences}',
                        color: context.color.redColor,
                        onTap: () async {
                          await AppLocator.router.navigate(
                            const WordsAndSentencesScreenRoute(),
                          );
                          tabViewBloc.add(
                            TabViewEvent.initialize(
                              isTablet: isTablet,
                              routeName: AppLocator.router.currentPath,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppDimensions.s16),
                      LessonCardComponent(
                        title: context.lang.discover,
                        content:
                            '${progressState.thingProgresses.length}/${AppLocator.remoteConfig.things}',
                        color: context.color.oliveColor,
                        onTap: () async {
                          await AppLocator.router.navigate(
                            const DiscoverScreenRoute(),
                          );
                          tabViewBloc.add(
                            TabViewEvent.initialize(
                              isTablet: isTablet,
                              routeName: AppLocator.router.currentPath,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(
                        child: LessonCardComponent(
                          title: context.lang.letters,
                          content:
                              '${progressState.letterProgresses.length}/${AppLocator.remoteConfig.letters}',
                          color: context.color.primary,
                          onTap: () async {
                            await AppLocator.router.navigate(
                              const LettersScreenRoute(),
                            );
                            tabViewBloc.add(
                              TabViewEvent.initialize(
                                isTablet: isTablet,
                                routeName: AppLocator.router.currentPath,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child: LessonCardComponent(
                          title: context.lang.numbers,
                          content:
                              '${progressState.numberProgresses.length}/${AppLocator.remoteConfig.numbers}',
                          color: context.color.secondary,
                          onTap: () async {
                            await AppLocator.router.navigate(
                              const NumbersScreenRoute(),
                            );
                            tabViewBloc.add(
                              TabViewEvent.initialize(
                                isTablet: isTablet,
                                routeName: AppLocator.router.currentPath,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child: LessonCardComponent(
                          title: context.lang.wordsAndSentences,
                          content:
                              '${progressState.totalWordNSentenceProgress}/${AppLocator.remoteConfig.wordNSentences}',
                          color: context.color.redColor,
                          onTap: () async {
                            await AppLocator.router.navigate(
                              const WordsAndSentencesScreenRoute(),
                            );
                            tabViewBloc.add(
                              TabViewEvent.initialize(
                                isTablet: isTablet,
                                routeName: AppLocator.router.currentPath,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child: LessonCardComponent(
                          title: context.lang.discover,
                          content:
                              '${progressState.thingProgresses.length}/${AppLocator.remoteConfig.things}',
                          color: context.color.oliveColor,
                          onTap: () async {
                            await AppLocator.router.navigate(
                              const DiscoverScreenRoute(),
                            );
                            tabViewBloc.add(
                              TabViewEvent.initialize(
                                isTablet: isTablet,
                                routeName: AppLocator.router.currentPath,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
