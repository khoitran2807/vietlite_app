import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/application/things_bloc.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/plugin/livechat/livechat_service.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:collection/collection.dart';

@RoutePage()
class ThingsScreen extends StatelessWidget {
  final String type;

  const ThingsScreen({super.key, @PathParam('type') required this.type});

  ThingType get thingType => ThingType.values.firstWhere(
    (e) => e.name == type,
    orElse: () => ThingType.animal,
  );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: thingType.title(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen:
            (previous, current) =>
                previous.isLoggedIn != current.isLoggedIn ||
                previous.isThingsPremium != current.isThingsPremium,
        builder: (context, userState) {
          if (!userState.isLoggedIn) {
            return const SizedBox.shrink();
          }
          return BlocProvider<ThingsBloc>(
            create:
                (context) =>
                    locator<ThingsBloc>()
                      ..add(ThingsEvent.getThings(type: thingType)),
            child: BlocConsumer<ThingsBloc, ThingsState>(
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
                  (previous, current) =>
                      previous.isLoading != current.isLoading ||
                      previous.things != current.things,
              builder: (context, thingState) {
                return (thingState.isLoading)
                    ? Center(child: Loading.medium())
                    : Column(
                      children: [
                        if (!context.isWebsite)
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppDimensions.s16,
                              right: AppDimensions.s16,
                            ),
                            child: const ProgressComponent(),
                          ),
                        Expanded(
                          child: BlocBuilder<ProgressBloc, ProgressState>(
                            buildWhen:
                                (previous, current) =>
                                    previous.userProgresses !=
                                    current.userProgresses,
                            builder: (context, progressState) {
                              return ListView.separated(
                                padding: EdgeInsets.all(AppDimensions.s16),
                                itemCount: thingState.things.length,
                                itemBuilder: (context, index) {
                                  final thing = thingState.things[index];
                                  final UserProgress? userProgress =
                                      progressState.userProgresses
                                          .firstWhereOrNull(
                                            (progress) =>
                                                progress.id == thing.id,
                                          );
                                  final completedExercises =
                                      userProgress?.completedExercises ?? 0;
                                  final isCompleted =
                                      completedExercises ==
                                      thing.totalExercises;
                                  final isInProgress =
                                      0 < completedExercises &&
                                      completedExercises < thing.totalExercises;

                                  return InkWell(
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.s12,
                                    ),
                                    onTap:
                                        (!thing.isPremium ||
                                                userState.isThingsPremium)
                                            ? () {
                                              AppLocator.router.push(
                                                ThingDetailScreenRoute(
                                                  id: thing.id,
                                                ),
                                              );
                                            }
                                            : null,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppDimensions.s16,
                                      ),
                                      height: AppDimensions.s64,
                                      decoration: BoxDecoration(
                                        color: context.color.foreground,
                                        borderRadius: BorderRadius.circular(
                                          AppDimensions.s12,
                                        ),
                                        border: Border.all(
                                          color:
                                              (!thing.isPremium ||
                                                      userState.isThingsPremium)
                                                  ? context
                                                      .color
                                                      .neutral
                                                      .shade200
                                                  : context
                                                      .color
                                                      .neutral
                                                      .shade300,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color:
                                                  context
                                                      .color
                                                      .redColor
                                                      .shade100,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${index + 1}',
                                              style: context
                                                  .defaultStyle
                                                  .bold
                                                  .s16
                                                  .copyWith(
                                                    color:
                                                        context.color.redColor,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: AppDimensions.s12),
                                          (isCompleted)
                                              ? SvgPicture.asset(
                                                AppIcons.completed,
                                              )
                                              : (isInProgress)
                                              ? SvgPicture.asset(
                                                AppIcons.inProgress,
                                              )
                                              : SvgPicture.asset(
                                                AppIcons.notStarted,
                                              ),
                                          SizedBox(width: AppDimensions.s12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  thing.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .defaultStyle
                                                      .bold
                                                      .copyWith(
                                                        color:
                                                            (!thing.isPremium ||
                                                                    userState
                                                                        .isThingsPremium)
                                                                ? context
                                                                    .color
                                                                    .neutral
                                                                : Colors.grey,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: AppDimensions.s4,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '$completedExercises',
                                                        style: context.defaultStyle.copyWith(
                                                          color:
                                                              (isCompleted)
                                                                  ? context
                                                                      .color
                                                                      .secondary
                                                                  : (isInProgress)
                                                                  ? context
                                                                      .color
                                                                      .primary
                                                                  : context
                                                                      .color
                                                                      .redColor,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '/${thing.totalExercises}',
                                                        style: context
                                                            .defaultStyle
                                                            .copyWith(
                                                              color:
                                                                  isCompleted
                                                                      ? context
                                                                          .color
                                                                          .secondary
                                                                      : context
                                                                          .color
                                                                          .neutral
                                                                          .shade100,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          (thing.isPremium &&
                                                  !userState.isThingsPremium)
                                              ? TextButton(
                                                onPressed: () {
                                                  LivechatService.sendMessage(
                                                    context.lang.unlockDiscover,
                                                  );
                                                },
                                                child: Text(
                                                  context.lang.unlock,
                                                  style:
                                                      context
                                                          .primaryStyle
                                                          .semiBold,
                                                ),
                                              )
                                              : Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    context
                                                        .color
                                                        .neutral
                                                        .shade400,
                                                size: 16,
                                              ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: AppDimensions.s12);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
              },
            ),
          );
        },
      ),
    );
  }
}
