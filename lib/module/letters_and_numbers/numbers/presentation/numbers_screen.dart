import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/application/number_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/card_colors.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';

@RoutePage()
class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

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
        return BlocProvider<NumbersBloc>(
          create:
              (context) =>
                  locator<NumbersBloc>()
                    ..add(NumberEvent.initialize(userId: userId)),
          child: BlocListener<NumbersBloc, NumberState>(
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
                      ProgressEvent.initNumbers(numbers: state.numbers),
                    );
                  },
                ),
              );
            },
            child: BlocBuilder<NumbersBloc, NumberState>(
              buildWhen: (previous, current) {
                return previous.isLoading != current.isLoading;
              },
              builder: (context, state) {
                return (state.isLoading)
                    ? Center(child: Loading.medium())
                    : GridView.builder(
                      padding: EdgeInsets.all(AppDimensions.s16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppDimensions.s12,
                        mainAxisSpacing: AppDimensions.s8,
                        mainAxisExtent: 104,
                      ),
                      itemCount: state.numbers.length,
                      itemBuilder: (context, index) {
                        final number = state.numbers[index];
                        final colors = CardColors.list(context);
                        final color = colors[Random().nextInt(colors.length)];
                        return InkWell(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.s16,
                          ),
                          onTap: () {
                            AppLocator.router.push(
                              NumberDetailScreenRoute(id: number.id),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.s16,
                              ),
                            ),
                            elevation: 0,
                            color: color.shade100,
                            child: Center(
                              child: Text(
                                state.numbers[index].title,
                                style: TextStyle(
                                  fontFamily: 'iCielPony',
                                  fontSize: AppDimensions.s36,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
