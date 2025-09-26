import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/lesson_card_component.dart';

class WordMatchProgressComponent extends StatelessWidget {
  const WordMatchProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      buildWhen:
          (previous, current) =>
              previous.wordMatches != current.wordMatches ||
              previous.wordMatchProgresses != current.wordMatchProgresses,
      builder: (context, progressState) {
        if (progressState.lastLearnedWordMatch == null) {
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
                        content: progressState.lastLearnedWordMatch!.title,
                        color: context.color.primary,
                        onTap:
                            () => context.router.push(
                              WordMatchDetailScreenRoute(
                                id: progressState.lastLearnedWordMatch!.id,
                              ),
                            ),
                      ),

                      SizedBox(height: AppDimensions.s16),
                      (progressState.nextLearnedWordMatch != null)
                          ? LessonCardComponent(
                            title: 'Bài học gợi ý',
                            content:
                                progressState.nextLearnedWordMatch?.title ?? '',
                            color: context.color.secondary,
                            onTap:
                                () => context.router.push(
                                  WordMatchDetailScreenRoute(
                                    id: progressState.nextLearnedWordMatch!.id,
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
                          content: progressState.lastLearnedWordMatch!.title,
                          color: context.color.primary,
                          onTap:
                              () => context.router.push(
                                WordMatchDetailScreenRoute(
                                  id: progressState.lastLearnedWordMatch!.id,
                                ),
                              ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.s12),
                      Expanded(
                        child:
                            (progressState.nextLearnedWordMatch != null)
                                ? LessonCardComponent(
                                  title: 'Bài học gợi ý',
                                  content:
                                      progressState
                                          .nextLearnedWordMatch
                                          ?.title ??
                                      '',
                                  color: context.color.secondary,
                                  onTap:
                                      () => context.router.push(
                                        WordMatchDetailScreenRoute(
                                          id:
                                              progressState
                                                  .nextLearnedWordMatch!
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
