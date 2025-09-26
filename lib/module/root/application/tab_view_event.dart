part of 'tab_view_bloc.dart';

@freezed
class TabViewEvent with _$TabViewEvent {
  const factory TabViewEvent.initialize({
    required bool isTablet,
    required String routeName,
  }) = _Initialize;

  const factory TabViewEvent.changeTab({required NavItem item}) = _ChangeTab;

  const factory TabViewEvent.changeChildTab({required NavChildItem childItem}) =
      _ChangeChildTab;
}
