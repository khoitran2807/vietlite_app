import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/discover/thing_exercise/presentation/thing_exercise_item.dart';
import 'package:vietlite/widget/audio_button.dart';
import 'package:vietlite/module/discover/thing_detail/application/thing_detail_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/alert_dialog.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:collection/collection.dart';

@RoutePage()
class ThingDetailScreen extends StatelessWidget {
  final String id;

  const ThingDetailScreen({super.key, @PathParam('id') required this.id});

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) => previous.isLoggedIn != current.isLoggedIn,
      builder: (context, authState) {
        if (!authState.isLoggedIn) {
          return const SizedBox.shrink();
        }
        return BlocProvider<ThingDetailBloc>(
          create:
              (context) =>
                  locator<ThingDetailBloc>()..add(
                    ThingDetailEvent.getThingDetail(
                      id: id,
                      userId: authState.appUser.id,
                    ),
                  ),

          child: BlocConsumer<ThingDetailBloc, ThingDetailState>(
            listenWhen:
                (previous, current) =>
                    previous.failureOrSuccessOption !=
                        current.failureOrSuccessOption &&
                    current.failureOrSuccessOption.isSome(),
            listener: (context, state) {
              state.failureOrSuccessOption.map(
                (either) => either.fold(
                  (failure) => showToast(context, failure.message),
                  (_) => null,
                ),
              );
            },
            buildWhen:
                (previous, current) => previous.isLoading != current.isLoading,
            builder: (context, state) {
              final thing = state.thing;
              return AppScaffold(
                title: context.lang.discover,
                child:
                    (state.isLoading)
                        ? Center(child: Loading.medium())
                        : Padding(
                          padding: EdgeInsets.only(
                            left: AppDimensions.s16,
                            right: AppDimensions.s16,
                          ),
                          child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: AppDimensions.s16),
                                        Container(
                                          width: double.infinity,
                                          height: AppDimensions.s44,
                                          decoration: BoxDecoration(
                                            color:
                                                context.color.neutral.shade300,
                                            borderRadius: BorderRadius.circular(
                                              AppDimensions.s8,
                                            ),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                thing.name,
                                                style: TextStyle(
                                                  fontFamily: 'iCielPony',
                                                  fontSize: AppDimensions.s24,
                                                  color:
                                                      context.color.secondary,
                                                ),
                                              ),
                                              Positioned(
                                                right: AppDimensions.s12,
                                                child: AudioButton(
                                                  audioUrl: thing.audio,
                                                  size: AppDimensions.s32,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        (thing.image.isNotEmpty)
                                            ? Padding(
                                              padding: EdgeInsets.only(
                                                top: AppDimensions.s16,
                                              ),
                                              child: _buildImage(
                                                context: context,
                                                imageUrl: thing.image,
                                              ),
                                            )
                                            : const SizedBox(),
                                        SizedBox(height: AppDimensions.s24),
                                        (thing.exercises.isNotEmpty)
                                            ? ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: thing.exercises.length,
                                              separatorBuilder:
                                                  (context, index) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical:
                                                              AppDimensions.s16,
                                                        ),
                                                    child: Divider(
                                                      color:
                                                          context
                                                              .color
                                                              .neutral
                                                              .shade200,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                              itemBuilder: (context, index) {
                                                final exercise =
                                                    thing.exercises[index];
                                                final userExercise = state
                                                    .exercises
                                                    .firstWhereOrNull(
                                                      (ue) =>
                                                          ue.id == exercise.id,
                                                    );
                                                final String? lastAnswer =
                                                    userExercise?.lastAnswer;

                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${context.lang.lesson} ${index + 1}',
                                                      style:
                                                          context
                                                              .defaultStyle
                                                              .bold
                                                              .s20,
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions.s16,
                                                    ),
                                                    ThingExerciseItem(
                                                      exercise: exercise,
                                                      thing: thing,
                                                      lastAnswer: lastAnswer,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                        ),
              );
            },
          ),
        );
      },
    );
  }
}
