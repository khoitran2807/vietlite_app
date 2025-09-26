import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/letters_and_numbers/letters/application/letters_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/card_colors.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/widget/loading.dart';
import 'package:vietlite/widget/toast.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/widget/button.dart';

@RoutePage()
class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColors = CardColors.list(context);

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) => previous.isLoggedIn != current.isLoggedIn,
      builder: (context, state) {
        if (state.appUser.id.isEmpty) {
          return const SizedBox.shrink();
        }
        final userId = state.appUser.id;
        return BlocProvider<LettersBloc>(
          create:
              (context) =>
                  locator<LettersBloc>()
                    ..add(LettersEvent.initialize(userId: userId)),
          child: BlocListener<LettersBloc, LettersState>(
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
                      ProgressEvent.initLetters(letters: state.letters),
                    );
                  },
                ),
              );
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppDimensions.s16),
              child: Column(
                children: [
                  _buildAlphabetButton(context),
                  SizedBox(height: AppDimensions.s20),
                  BlocBuilder<LettersBloc, LettersState>(
                    buildWhen: (previous, current) {
                      return previous.isLoading != current.isLoading;
                    },
                    builder: (context, state) {
                      return (state.isLoading)
                          ? Center(child: Loading.medium())
                          : _buildLetterGrid(state.letters, cardColors);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAlphabetButton(BuildContext context) {
    return Button.secondary(
      onPressed: () {
        context.router.push(const AlphabetScreenRoute());
      },
      buttonName: context.lang.alphabet,
      suffixIcon: Icon(Icons.east, size: AppDimensions.s20),
      backgroundColor: context.color.foreground,
      padding: 16,
      foregroundColor: context.color.neutral,
      borderSide: BorderSide(color: context.color.neutral.shade200),
    );
  }

  Widget _buildLetterGrid(List<Letter> letters, List<MaterialColor> colors) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.s12,
        mainAxisSpacing: AppDimensions.s8,
        mainAxisExtent: 104,
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        final letter = letters[index];
        final color = colors[Random().nextInt(colors.length)];
        return InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.s16),
          onTap: () {
            AppLocator.router.push(LetterDetailScreenRoute(id: letter.id));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.s16),
            ),
            elevation: 0,
            color: color.shade100,
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.s4),
              child: Center(
                child: Text(
                  letter.title,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'iCielPony',
                    fontSize: AppDimensions.s32,
                    color: color,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
