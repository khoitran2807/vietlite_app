import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/discover/root/application/discover_bloc.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: (context.isTablet) ? '' : context.lang.objectsAndThings,
      autoImplyLeading: false,
      child: Column(
        children: [
          if (!context.isWebsite)
            Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.s16,
                right: AppDimensions.s16,
              ),
              child: const ProgressComponent(),
            ),
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen:
                (previous, current) =>
                    previous.isLoggedIn != current.isLoggedIn,
            builder: (context, state) {
              if (state.appUser.id.isEmpty) {
                return const SizedBox.shrink();
              }
              final userId = state.appUser.id;
              return BlocProvider<DiscoverBloc>(
                create:
                    (context) =>
                        locator<DiscoverBloc>()
                          ..add(DiscoverEvent.initialize(userId: userId)),
                child: BlocListener<DiscoverBloc, DiscoverState>(
                  listenWhen:
                      (previous, current) =>
                          previous.fetchFailure != current.fetchFailure &&
                          current.fetchFailure.isSome(),
                  listener: (context, state) {
                    state.fetchFailure.map(
                      (either) => either.fold(
                        (failure) => showToast(context, failure.message),
                        (_) {
                          context.read<ProgressBloc>().add(
                            ProgressEvent.initThings(things: state.things),
                          );
                        },
                      ),
                    );
                  },
                  child: Expanded(
                    child: LayoutBuilder(
                      builder: (
                        BuildContext context,
                        BoxConstraints constraints,
                      ) {
                        double maxWidth = constraints.maxWidth;
                        double widthImage =
                            (maxWidth - (3 * AppDimensions.s16)) / 2;
                        double heightImage = widthImage;
                        return GridView.builder(
                          padding: EdgeInsets.all(AppDimensions.s16),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // 2 columns
                                crossAxisSpacing: AppDimensions.s16,
                                // Space between columns
                                mainAxisSpacing: AppDimensions.s16,
                                // Space between rows
                                mainAxisExtent: (heightImage),
                              ),
                          itemCount: ThingType.values.length,
                          itemBuilder: (context, index) {
                            final item = ThingType.values[index];
                            return InkWell(
                              onTap: () {
                                context.router.push(
                                  ThingsScreenRoute(type: item.name),
                                );
                              },
                              child: Card(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.s8,
                                  ),
                                  side: BorderSide(
                                    color: context.color.neutral.shade200,
                                    width: 1.0,
                                  ),
                                ),
                                color: context.color.foreground,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.s8,
                                  ),
                                  child: Stack(
                                    children: [
                                      // Ảnh
                                      SizedBox(
                                        width: double.infinity,
                                        height: heightImage,
                                        child: Image.asset(
                                          item.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 8,
                                        right: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: context.isTablet ?
                                          Text(
                                            item.title(context),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'iCielPony',
                                              fontSize: AppDimensions.s24,
                                              color: context.color.foreground,
                                            ),
                                          )
                                              : Text(
                                            item.title(context),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'iCielPony',
                                              fontSize: AppDimensions.s16,
                                              color: context.color.foreground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
