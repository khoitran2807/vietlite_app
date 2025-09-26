import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/module/progress/presentation/home_progress_component.dart';
import 'package:vietlite/module/progress/presentation/word_match_progress_component.dart';
import 'package:vietlite/module/progress/presentation/word_selection_progress_component.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'discover_progress_component.dart';
import 'letter_progress_component.dart';
import 'number_progress_component.dart';

class ProgressComponent extends StatelessWidget {
  const ProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen:
          (previous, current) =>
              previous.isLoggedInWithEmail != current.isLoggedInWithEmail,
      builder: (context, authState) {
        if (!authState.isLoggedInWithEmail) {
          return const SizedBox();
        }
        return BlocBuilder<TabViewBloc, TabViewState>(
          buildWhen:
              (previous, current) =>
                  previous.selectedTab != current.selectedTab ||
                  previous.selectedChildTab != current.selectedChildTab ||
                  previous.tabs != current.tabs,
          builder: (context, tabState) {
            if (tabState.isHome || tabState.isSetting) {
              return const HomeProgressComponent();
            }
            if (tabState.isLetter) {
              return const LetterProgressComponent();
            }
            if (tabState.isNumber) {
              return const NumberProgressComponent();
            }
            if (tabState.isDiscover) {
              return const DiscoverProgressComponent();
            }
            if (tabState.isWordSelection) {
              return const WordSelectionProgressComponent();
            }
            if (tabState.isWordMatch) {
              return const WordMatchProgressComponent();
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
