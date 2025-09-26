import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/res.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/application/letter_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/example_section.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/hightlight_text.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/spell_section.dart';
import 'package:vietlite/widget/audio_button.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/alert_dialog.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class LetterDetailScreen extends StatelessWidget {
  final String id;

  const LetterDetailScreen({super.key, @PathParam('id') required this.id});

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

        return BlocProvider<LetterDetailBloc>(
          create:
              (context) =>
                  locator<LetterDetailBloc>()..add(
                    LetterDetailEvent.getLetterDetail(id: id, userId: userId),
                  ),

          child: MultiBlocListener(
            listeners: [
              BlocListener<LetterDetailBloc, LetterDetailState>(
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
                          context.read<LetterDetailBloc>().add(
                            LetterDetailEvent.updateLetterDetailProgress(
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
              BlocListener<LetterDetailBloc, LetterDetailState>(
                listenWhen:
                    (previous, current) =>
                        previous.fetchLetterDetailProgress !=
                            current.fetchLetterDetailProgress &&
                        current.fetchLetterDetailProgress.isSome(),
                listener: (context, state) {
                  state.fetchLetterDetailProgress.map(
                    (either) => either.fold((failure) => {}, (_) {
                      context.read<ProgressBloc>().add(
                        ProgressEvent.updateProgress(
                          progress: UserProgress(
                            id: id,
                            exerciseType: ExerciseType.letter,
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
            child: BlocBuilder<LetterDetailBloc, LetterDetailState>(
              buildWhen:
                  (previous, current) =>
                      previous.isLoading != current.isLoading,
              builder: (context, state) {
                final letter = state.letter;
                final letterSpell = letter.spell;
                final highlightListLetter =
                    letter.title.split(' ').where((e) => e.isNotEmpty).toList();
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
                                          child: Text(
                                            letter.title,
                                            style: TextStyle(
                                              fontFamily: 'iCielPony',
                                              fontSize: AppDimensions.s64,
                                              color: context.color.secondary,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: AppDimensions.s16,
                                          right: AppDimensions.s12,
                                          child: AudioButton(
                                            key: WidgetKeys.audioTitle,
                                            audioUrl: state.letter.audioTitle,
                                            size: AppDimensions.s32,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: AppDimensions.s8),
                                  _buildImage(
                                    context: context,
                                    imageUrl: letter.mainExample.image,
                                  ),
                                  SizedBox(height: AppDimensions.s8),
                                  if (letter.mainExample.title.isNotEmpty)
                                    Container(
                                      height: AppDimensions.s44,
                                      decoration: BoxDecoration(
                                        color: context.color.neutral.shade300,
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.s8,
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text.rich(
                                              TextSpan(
                                                children: highlightText(
                                                  letter.mainExample.title,
                                                  highlightListLetter,
                                                  context.color.error,
                                                  baseStyle: TextStyle(
                                                    fontFamily: 'iCielPony',
                                                    fontSize: AppDimensions.s16,
                                                    color:
                                                        context
                                                            .color
                                                            .neutral
                                                            .shade400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: AppDimensions.s12,
                                            child: AudioButton(
                                              audioUrl:
                                                  letter.mainExample.audio,
                                              size: AppDimensions.s32,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ///Spell
                                  if (letterSpell.spells.isNotEmpty) ...[
                                    _buildTitle(context, context.lang.spell),
                                    SpellSection(
                                      spells: letter.spell.spells,
                                      highlightSpellText: highlightListLetter,
                                      audioUrl: letter.spell.audioSpell,
                                    ),
                                  ],
                                  if (letter.spell.accents.isNotEmpty) ...[
                                    SizedBox(height: AppDimensions.s8),
                                    Container(
                                      height: AppDimensions.s62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.s8,
                                        ),
                                        color: context.color.neutral.shade300,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: AppDimensions.s56,
                                                left: AppDimensions.s12,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children:
                                                    letter.spell.accents
                                                        .map(
                                                          (accent) => Text(
                                                            accent,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'iCielPony',
                                                              fontSize:
                                                                  AppDimensions
                                                                      .s16,
                                                              color:
                                                                  context
                                                                      .color
                                                                      .neutral
                                                                      .shade400,
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: AppDimensions.s12,
                                            child: AudioButton(
                                              audioUrl:
                                                  letter.spell.audioAccent,
                                              size: AppDimensions.s32,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],

                                  ///Examples
                                  if (letter.examples.isNotEmpty)
                                    _buildTitle(context, context.lang.examples),
                                  ExampleSection(examples: letter.examples),
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

  Widget _buildImage({
    required BuildContext context,
    required String imageUrl,
  }) {
    return InkWell(
      onTap: () {
        showAppDialog(
          context: context,
          width:
              (context.isTablet)
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width - 64,
          body: InteractiveViewer(
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 25 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.s8),
          child:
              imageUrl.isNotEmpty && imageUrl.startsWith('http')
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Image.asset(AppImages.defaultImage, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
