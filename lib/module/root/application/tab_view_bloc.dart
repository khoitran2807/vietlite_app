import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:injectable/injectable.dart';

part 'tab_view_event.dart';

part 'tab_view_state.dart';

part 'tab_view_bloc.freezed.dart';

@singleton
class TabViewBloc extends Bloc<TabViewEvent, TabViewState> {
  TabViewBloc() : super(TabViewState.initial()) {
    on<TabViewEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          NavItem newTab = NavItem.values.firstWhere(
            (e) => value.routeName.contains(e.routeName),
            orElse: () => state.selectedTab,
          );
          NavChildItem newChildTab = NavChildItem.values.firstWhere(
            (e) => value.routeName.contains(e.routeName),
            orElse: () => state.selectedChildTab,
          );
          if (value.isTablet) {
            if (!state.isTablet ||
                state.selectedTab != newTab ||
                state.selectedChildTab != newChildTab) {
              emit(
                state.copyWith(
                  tabs: [
                    NavItem.home,
                    NavItem.lettersNNumbers,
                    NavItem.wordsNSentences,
                    NavItem.discover,
                    NavItem.setting,
                  ],
                  isTablet: true,
                  selectedTab: newTab,
                  selectedChildTab: newChildTab,
                ),
              );
            }
          } else {
            if (state.isTablet ||
                state.selectedTab != newTab ||
                state.selectedChildTab != newChildTab) {
              emit(
                state.copyWith(
                  tabs: [
                    NavItem.lettersNNumbers,
                    NavItem.wordsNSentences,
                    NavItem.home,
                    NavItem.discover,
                    NavItem.setting,
                  ],
                  isTablet: false,
                  selectedTab: newTab,
                  selectedChildTab: newChildTab,
                ),
              );
            }
          }
        },
        changeTab: (_ChangeTab value) async {
          if (value.item.children.isNotEmpty) {
            emit(
              state.copyWith(
                selectedTab: value.item,
                selectedChildTab: value.item.children.first,
              ),
            );
          } else {
            emit(state.copyWith(selectedTab: value.item));
          }
        },
        changeChildTab: (_ChangeChildTab value) {
          emit(state.copyWith(selectedChildTab: value.childItem));
        },
      );
    });
  }
}
