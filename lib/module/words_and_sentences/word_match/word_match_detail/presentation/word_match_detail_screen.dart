import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/application/word_match_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/presentation/word_match_exercise_item.dart';
import 'package:vietlite/plugin/livechat/livechat_service.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';

@RoutePage()
class WordMatchDetailScreen extends StatelessWidget {
  final String id;

  const WordMatchDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) => previous.isLoggedIn != current.isLoggedIn,
      builder: (context, userState) {
        if (userState.appUser.id.isEmpty) {
          return const SizedBox.shrink();
        }
        final userId = userState.appUser.id;
        return BlocProvider<WordMatchDetailBloc>(
          create:
              (context) =>
                  locator<WordMatchDetailBloc>()..add(
                    WordMatchDetailEvent.initialize(
                      id: id,
                      userId: userId,
                      progressId: id,
                    ),
                  ),
          child: BlocConsumer<WordMatchDetailBloc, WordMatchDetailState>(
            listenWhen:
                (previous, current) =>
                    previous.fetchFailure != current.fetchFailure &&
                    current.fetchFailure.isSome(),
            listener: (context, state) {
              state.fetchFailure.map(
                (either) => either.fold(
                  (failure) => showToast(context, context.lang.errorHappened),
                  (_) => null,
                ),
              );
            },
            buildWhen:
                (previous, current) => previous.isLoading != current.isLoading,
            builder: (context, state) {
              if (state.isLoading) return Center(child: Loading.medium());
              final wordMatch = state.wordMatch;

              return AppScaffold(
                title: wordMatch.title,
                actions: [
                  (wordMatch.title.isNotEmpty)
                      ? TextButton(
                        onPressed: () {
                          LivechatService.sendMessage(
                            context.lang.lessonFeedback(
                              '${context.lang.matchWordToPicture} ${wordMatch.title}',
                            ),
                          );
                        },
                        child: Text(
                          context.lang.feedback,
                          style: context.primaryStyle.semiBold,
                        ),
                      )
                      : const SizedBox(),
                ],
                child:
                    (wordMatch.isPremium && !userState.isWordMatchPremium)
                        ? Padding(
                          padding: EdgeInsets.all(AppDimensions.s16),
                          child: Row(
                            children: [
                              const Text(
                                'Bạn cần mở khoá để sử dụng chức năng này',
                              ),
                              TextButton(
                                onPressed: () {
                                  LivechatService.sendMessage(
                                    'Tôi muốn mở khoá tính năng Ghép từ vào tranh',
                                  );
                                },
                                child: Text(
                                  'Mở khoá',
                                  style: context.primaryStyle.semiBold,
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.separated(
                          padding: EdgeInsets.all(AppDimensions.s16),
                          itemCount: wordMatch.exercises.length,
                          separatorBuilder:
                              (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.s8,
                                ),
                                child: Divider(
                                  color: context.color.neutral.shade200,
                                  thickness: 1,
                                ),
                              ),
                          itemBuilder: (context, index) {
                            final exercise = wordMatch.exercises[index];
                            final userExercise = state.exercises
                                .firstWhereOrNull((ue) => ue.id == exercise.id);
                            final String? lastAnswer = userExercise?.lastAnswer;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${context.lang.lesson} ${index + 1}',
                                  style: context.defaultStyle.bold.s20,
                                ),
                                SizedBox(height: AppDimensions.s16),
                                WordMatchExerciseItem(
                                  lastAnswer: lastAnswer,
                                  exercise: exercise,
                                  wordMatch: wordMatch,
                                ),
                              ],
                            );
                          },
                        ),
              );
            },
          ),
        );
      },
    );
  }
}
