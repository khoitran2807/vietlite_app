import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/lesson_card_component.dart';

class DiscoverProgressComponent extends StatelessWidget {
  const DiscoverProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      buildWhen:
          (previous, current) =>
              previous.things != current.things ||
              previous.thingProgresses != current.thingProgresses,
      builder: (context, progressState) {
        if (progressState.lastLearnedThing == null) {
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
                        title: 'Bài học gần nhất',
                        content: progressState.lastLearnedThing!.name,
                        color: context.color.primary,
                        onTap:
                            () => context.router.push(
                              ThingDetailScreenRoute(
                                id: progressState.lastLearnedThing!.id,
                              ),
                            ),
                      ),

                      SizedBox(height: AppDimensions.s16),
                      (progressState.nextLearnedThing != null)
                          ? LessonCardComponent(
                            title: 'Bài học gợi ý',
                            content: progressState.nextLearnedThing?.name ?? '',
                            color: context.color.secondary,
                            onTap:
                                () => context.router.push(
                                  ThingDetailScreenRoute(
                                    id: progressState.nextLearnedThing!.id,
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
                          title: 'Bài học gần nhất',
                          content: progressState.lastLearnedThing!.name,
                          color: context.color.primary,
                          onTap:
                              () => context.router.push(
                                ThingDetailScreenRoute(
                                  id: progressState.lastLearnedThing!.id,
                                ),
                              ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child: LessonCardComponent(
                          title: 'Bài học gợi ý',
                          content: progressState.nextLearnedThing?.name ?? '',
                          color: context.color.secondary,
                          onTap:
                              () => context.router.push(
                                ThingDetailScreenRoute(
                                  id: progressState.nextLearnedThing!.id,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
