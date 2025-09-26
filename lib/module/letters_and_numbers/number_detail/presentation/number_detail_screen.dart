import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/res.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/application/number_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/example_section.dart';
import 'package:vietlite/widget/audio_button.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/spell_section.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/count_items.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class NumberDetailScreen extends StatelessWidget {
  final String id;

  const NumberDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) => previous.isLoggedIn != current.isLoggedIn,
      builder: (context, state) {
        if (state.appUser.id.isEmpty) {
          return const SizedBox.shrink();
        }
        final userId = state.appUser.id;
        return BlocProvider<NumberDetailBloc>(
          create:
              (context) =>
                  locator<NumberDetailBloc>()..add(
                    NumberDetailEvent.getNumberDetail(id: id, userId: userId),
                  ),
          child: MultiBlocListener(
            listeners: [
              BlocListener<NumberDetailBloc, NumberDetailState>(
                listenWhen:
                    (previous, current) =>
                        previous.failureOrSuccessOption !=
                            current.failureOrSuccessOption &&
                        current.failureOrSuccessOption.isSome(),
                listener: (context, state) {
                  state.failureOrSuccessOption.map(
                    (either) => either.fold(
                      (failure) => showToast(context, failure.message),
                      (success) {
                        final signedInWithEmail =
                            context.read<AuthBloc>().state.isLoggedInWithEmail;
                        if (signedInWithEmail) {
                          context.read<NumberDetailBloc>().add(
                            NumberDetailEvent.updateNumberDetailProgress(
                              userId: userId,
                              progressId: id,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
              BlocListener<NumberDetailBloc, NumberDetailState>(
                listenWhen:
                    (previous, current) =>
                        previous.fetchNumberDetailProgress !=
                            current.fetchNumberDetailProgress &&
                        current.fetchNumberDetailProgress.isSome(),
                listener: (context, state) {
                  state.fetchNumberDetailProgress.map(
                    (either) => either.fold((failure) => {}, (_) {
                      context.read<ProgressBloc>().add(
                        ProgressEvent.updateProgress(
                          progress: UserProgress(
                            id: id,
                            exerciseType: ExerciseType.number,
                            writeAt: DateTime.now(),
                            exercises: [],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
            child: BlocBuilder<NumberDetailBloc, NumberDetailState>(
              buildWhen:
                  (previous, current) =>
                      previous.isLoading != current.isLoading,
              builder: (context, state) {
                final number = state.number;
                final numberSpell = number.spell;
                final highlightListNumber =
                    number.title.split(' ').where((e) => e.isNotEmpty).toList();
                return AppScaffold(
                  title: context.lang.recognize,
                  child:
                      (state.isLoading)
                          ? Center(child: Loading.medium())
                          : Padding(
                            padding: EdgeInsets.only(
                              left: AppDimensions.s16,
                              right: AppDimensions.s16,
                              bottom: AppDimensions.s16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: AppDimensions.s16),
                                  Container(
                                    height: AppDimensions.s130,
                                    decoration: BoxDecoration(
                                      color: context.color.neutral.shade300,
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.s8,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                number.title,
                                                style: TextStyle(
                                                  fontFamily: 'iCielPony',
                                                  fontSize: AppDimensions.s64,
                                                  height: 1.0,
                                                  color:
                                                      context
                                                          .color
                                                          .nameColor
                                                          .shade100,
                                                ),
                                              ),
                                              Text(
                                                number.textTitle,
                                                style: TextStyle(
                                                  fontFamily: 'iCielPony',
                                                  fontSize: AppDimensions.s32,
                                                  height: 1.0,
                                                  color:
                                                      context
                                                          .color
                                                          .neutral
                                                          .shade400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: AppDimensions.s16,
                                          right: AppDimensions.s12,
                                          child: AudioButton(
                                            audioUrl: state.number.audio,
                                            size: AppDimensions.s32,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (number.count.colored.isNotEmpty &&
                                          number.count.noColor.isNotEmpty)
                                      ? CountItems(number: state.number)
                                      : const SizedBox(),

                                  ///Spell
                                  if (numberSpell.details.isNotEmpty) ...[
                                    _buildTitle(context, context.lang.spell),
                                    SpellSection(
                                      spells: numberSpell.details,
                                      highlightSpellText: highlightListNumber,
                                      audioUrl: numberSpell.audio,
                                    ),
                                  ],

                                  ///Examples
                                  if (number.examples.isNotEmpty)
                                    _buildTitle(context, context.lang.examples),
                                  ExampleSection(examples: number.examples),
                                ],
                              ),
                            ),
                          ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context, String title) => Padding(
    padding: EdgeInsets.only(bottom: AppDimensions.s16, top: AppDimensions.s16),
    child: Text(title, style: context.defaultStyle.bold.s20),
  );
}
