import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/lesson_card_component.dart';

class NumberProgressComponent extends StatelessWidget {
  const NumberProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      buildWhen:
          (previous, current) =>
              previous.numbers != current.numbers ||
              previous.numberProgresses != current.numberProgresses,
      builder: (context, progressState) {
        if (progressState.lastLearnedNumber == null) {
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
                        title: context.lang.lastLesson,
                        content:
                            '${context.lang.number} ${progressState.lastLearnedNumber!.title}',
                        color: context.color.primary,
                        onTap:
                            () => context.router.push(
                              NumberDetailScreenRoute(
                                id: progressState.lastLearnedNumber!.id,
                              ),
                            ),
                      ),

                      SizedBox(height: AppDimensions.s16),
                      (progressState.nextLearnedNumber != null)
                          ? LessonCardComponent(
                            title: context.lang.suggestedLesson,
                            content:
                                '${context.lang.number} ${progressState.nextLearnedNumber?.title ?? ''}',
                            color: context.color.secondary,
                            onTap:
                                () => context.router.push(
                                  NumberDetailScreenRoute(
                                    id: progressState.nextLearnedNumber!.id,
                                  ),
                                ),
                          )
                          : const SizedBox(),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(
                        child: LessonCardComponent(
                          title: context.lang.lastLesson,
                          content:
                              '${context.lang.number} ${progressState.lastLearnedNumber!.title}',
                          color: context.color.primary,
                          onTap:
                              () => context.router.push(
                                NumberDetailScreenRoute(
                                  id: progressState.lastLearnedNumber!.id,
                                ),
                              ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child:
                            (progressState.nextLearnedNumber != null)
                                ? LessonCardComponent(
                                  title: context.lang.suggestedLesson,
                                  content:
                                      '${context.lang.number} ${progressState.nextLearnedNumber?.title ?? ''}',
                                  color: context.color.secondary,
                                  onTap:
                                      () => context.router.push(
                                        NumberDetailScreenRoute(
                                          id:
                                              progressState
                                                  .nextLearnedNumber!
                                                  .id,
                                        ),
                                      ),
                                )
                                : const SizedBox(),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
