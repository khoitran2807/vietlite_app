// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TabViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isTablet, String routeName) initialize,
    required TResult Function(NavItem item) changeTab,
    required TResult Function(NavChildItem childItem) changeChildTab,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isTablet, String routeName)? initialize,
    TResult? Function(NavItem item)? changeTab,
    TResult? Function(NavChildItem childItem)? changeChildTab,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isTablet, String routeName)? initialize,
    TResult Function(NavItem item)? changeTab,
    TResult Function(NavChildItem childItem)? changeChildTab,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_ChangeChildTab value) changeChildTab,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_ChangeChildTab value)? changeChildTab,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_ChangeChildTab value)? changeChildTab,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabViewEventCopyWith<$Res> {
  factory $TabViewEventCopyWith(
    TabViewEvent value,
    $Res Function(TabViewEvent) then,
  ) = _$TabViewEventCopyWithImpl<$Res, TabViewEvent>;
}

/// @nodoc
class _$TabViewEventCopyWithImpl<$Res, $Val extends TabViewEvent>
    implements $TabViewEventCopyWith<$Res> {
  _$TabViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
    _$InitializeImpl value,
    $Res Function(_$InitializeImpl) then,
  ) = __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isTablet, String routeName});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$TabViewEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isTablet = null, Object? routeName = null}) {
    return _then(
      _$InitializeImpl(
        isTablet:
            null == isTablet
                ? _value.isTablet
                : isTablet // ignore: cast_nullable_to_non_nullable
                    as bool,
        routeName:
            null == routeName
                ? _value.routeName
                : routeName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.isTablet, required this.routeName});

  @override
  final bool isTablet;
  @override
  final String routeName;

  @override
  String toString() {
    return 'TabViewEvent.initialize(isTablet: $isTablet, routeName: $routeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.isTablet, isTablet) ||
                other.isTablet == isTablet) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTablet, routeName);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isTablet, String routeName) initialize,
    required TResult Function(NavItem item) changeTab,
    required TResult Function(NavChildItem childItem) changeChildTab,
  }) {
    return initialize(isTablet, routeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isTablet, String routeName)? initialize,
    TResult? Function(NavItem item)? changeTab,
    TResult? Function(NavChildItem childItem)? changeChildTab,
  }) {
    return initialize?.call(isTablet, routeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isTablet, String routeName)? initialize,
    TResult Function(NavItem item)? changeTab,
    TResult Function(NavChildItem childItem)? changeChildTab,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(isTablet, routeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_ChangeChildTab value) changeChildTab,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_ChangeChildTab value)? changeChildTab,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_ChangeChildTab value)? changeChildTab,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements TabViewEvent {
  const factory _Initialize({
    required final bool isTablet,
    required final String routeName,
  }) = _$InitializeImpl;

  bool get isTablet;
  String get routeName;

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTabImplCopyWith<$Res> {
  factory _$$ChangeTabImplCopyWith(
    _$ChangeTabImpl value,
    $Res Function(_$ChangeTabImpl) then,
  ) = __$$ChangeTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NavItem item});
}

/// @nodoc
class __$$ChangeTabImplCopyWithImpl<$Res>
    extends _$TabViewEventCopyWithImpl<$Res, _$ChangeTabImpl>
    implements _$$ChangeTabImplCopyWith<$Res> {
  __$$ChangeTabImplCopyWithImpl(
    _$ChangeTabImpl _value,
    $Res Function(_$ChangeTabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _$ChangeTabImpl(
        item:
            null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                    as NavItem,
      ),
    );
  }
}

/// @nodoc

class _$ChangeTabImpl implements _ChangeTab {
  const _$ChangeTabImpl({required this.item});

  @override
  final NavItem item;

  @override
  String toString() {
    return 'TabViewEvent.changeTab(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTabImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTabImplCopyWith<_$ChangeTabImpl> get copyWith =>
      __$$ChangeTabImplCopyWithImpl<_$ChangeTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isTablet, String routeName) initialize,
    required TResult Function(NavItem item) changeTab,
    required TResult Function(NavChildItem childItem) changeChildTab,
  }) {
    return changeTab(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isTablet, String routeName)? initialize,
    TResult? Function(NavItem item)? changeTab,
    TResult? Function(NavChildItem childItem)? changeChildTab,
  }) {
    return changeTab?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isTablet, String routeName)? initialize,
    TResult Function(NavItem item)? changeTab,
    TResult Function(NavChildItem childItem)? changeChildTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_ChangeChildTab value) changeChildTab,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_ChangeChildTab value)? changeChildTab,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_ChangeChildTab value)? changeChildTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeTab implements TabViewEvent {
  const factory _ChangeTab({required final NavItem item}) = _$ChangeTabImpl;

  NavItem get item;

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeTabImplCopyWith<_$ChangeTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeChildTabImplCopyWith<$Res> {
  factory _$$ChangeChildTabImplCopyWith(
    _$ChangeChildTabImpl value,
    $Res Function(_$ChangeChildTabImpl) then,
  ) = __$$ChangeChildTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NavChildItem childItem});
}

/// @nodoc
class __$$ChangeChildTabImplCopyWithImpl<$Res>
    extends _$TabViewEventCopyWithImpl<$Res, _$ChangeChildTabImpl>
    implements _$$ChangeChildTabImplCopyWith<$Res> {
  __$$ChangeChildTabImplCopyWithImpl(
    _$ChangeChildTabImpl _value,
    $Res Function(_$ChangeChildTabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? childItem = null}) {
    return _then(
      _$ChangeChildTabImpl(
        childItem:
            null == childItem
                ? _value.childItem
                : childItem // ignore: cast_nullable_to_non_nullable
                    as NavChildItem,
      ),
    );
  }
}

/// @nodoc

class _$ChangeChildTabImpl implements _ChangeChildTab {
  const _$ChangeChildTabImpl({required this.childItem});

  @override
  final NavChildItem childItem;

  @override
  String toString() {
    return 'TabViewEvent.changeChildTab(childItem: $childItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeChildTabImpl &&
            (identical(other.childItem, childItem) ||
                other.childItem == childItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, childItem);

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeChildTabImplCopyWith<_$ChangeChildTabImpl> get copyWith =>
      __$$ChangeChildTabImplCopyWithImpl<_$ChangeChildTabImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isTablet, String routeName) initialize,
    required TResult Function(NavItem item) changeTab,
    required TResult Function(NavChildItem childItem) changeChildTab,
  }) {
    return changeChildTab(childItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isTablet, String routeName)? initialize,
    TResult? Function(NavItem item)? changeTab,
    TResult? Function(NavChildItem childItem)? changeChildTab,
  }) {
    return changeChildTab?.call(childItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isTablet, String routeName)? initialize,
    TResult Function(NavItem item)? changeTab,
    TResult Function(NavChildItem childItem)? changeChildTab,
    required TResult orElse(),
  }) {
    if (changeChildTab != null) {
      return changeChildTab(childItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_ChangeChildTab value) changeChildTab,
  }) {
    return changeChildTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_ChangeChildTab value)? changeChildTab,
  }) {
    return changeChildTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_ChangeChildTab value)? changeChildTab,
    required TResult orElse(),
  }) {
    if (changeChildTab != null) {
      return changeChildTab(this);
    }
    return orElse();
  }
}

abstract class _ChangeChildTab implements TabViewEvent {
  const factory _ChangeChildTab({required final NavChildItem childItem}) =
      _$ChangeChildTabImpl;

  NavChildItem get childItem;

  /// Create a copy of TabViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeChildTabImplCopyWith<_$ChangeChildTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TabViewState {
  List<NavItem> get tabs => throw _privateConstructorUsedError;
  bool get isTablet => throw _privateConstructorUsedError;
  NavItem get selectedTab => throw _privateConstructorUsedError;
  NavChildItem get selectedChildTab => throw _privateConstructorUsedError;

  /// Create a copy of TabViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabViewStateCopyWith<TabViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabViewStateCopyWith<$Res> {
  factory $TabViewStateCopyWith(
    TabViewState value,
    $Res Function(TabViewState) then,
  ) = _$TabViewStateCopyWithImpl<$Res, TabViewState>;
  @useResult
  $Res call({
    List<NavItem> tabs,
    bool isTablet,
    NavItem selectedTab,
    NavChildItem selectedChildTab,
  });
}

/// @nodoc
class _$TabViewStateCopyWithImpl<$Res, $Val extends TabViewState>
    implements $TabViewStateCopyWith<$Res> {
  _$TabViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? isTablet = null,
    Object? selectedTab = null,
    Object? selectedChildTab = null,
  }) {
    return _then(
      _value.copyWith(
            tabs:
                null == tabs
                    ? _value.tabs
                    : tabs // ignore: cast_nullable_to_non_nullable
                        as List<NavItem>,
            isTablet:
                null == isTablet
                    ? _value.isTablet
                    : isTablet // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedTab:
                null == selectedTab
                    ? _value.selectedTab
                    : selectedTab // ignore: cast_nullable_to_non_nullable
                        as NavItem,
            selectedChildTab:
                null == selectedChildTab
                    ? _value.selectedChildTab
                    : selectedChildTab // ignore: cast_nullable_to_non_nullable
                        as NavChildItem,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TabViewStateImplCopyWith<$Res>
    implements $TabViewStateCopyWith<$Res> {
  factory _$$TabViewStateImplCopyWith(
    _$TabViewStateImpl value,
    $Res Function(_$TabViewStateImpl) then,
  ) = __$$TabViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<NavItem> tabs,
    bool isTablet,
    NavItem selectedTab,
    NavChildItem selectedChildTab,
  });
}

/// @nodoc
class __$$TabViewStateImplCopyWithImpl<$Res>
    extends _$TabViewStateCopyWithImpl<$Res, _$TabViewStateImpl>
    implements _$$TabViewStateImplCopyWith<$Res> {
  __$$TabViewStateImplCopyWithImpl(
    _$TabViewStateImpl _value,
    $Res Function(_$TabViewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TabViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? isTablet = null,
    Object? selectedTab = null,
    Object? selectedChildTab = null,
  }) {
    return _then(
      _$TabViewStateImpl(
        tabs:
            null == tabs
                ? _value._tabs
                : tabs // ignore: cast_nullable_to_non_nullable
                    as List<NavItem>,
        isTablet:
            null == isTablet
                ? _value.isTablet
                : isTablet // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedTab:
            null == selectedTab
                ? _value.selectedTab
                : selectedTab // ignore: cast_nullable_to_non_nullable
                    as NavItem,
        selectedChildTab:
            null == selectedChildTab
                ? _value.selectedChildTab
                : selectedChildTab // ignore: cast_nullable_to_non_nullable
                    as NavChildItem,
      ),
    );
  }
}

/// @nodoc

class _$TabViewStateImpl extends _TabViewState {
  const _$TabViewStateImpl({
    required final List<NavItem> tabs,
    required this.isTablet,
    required this.selectedTab,
    required this.selectedChildTab,
  }) : _tabs = tabs,
       super._();

  final List<NavItem> _tabs;
  @override
  List<NavItem> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  @override
  final bool isTablet;
  @override
  final NavItem selectedTab;
  @override
  final NavChildItem selectedChildTab;

  @override
  String toString() {
    return 'TabViewState(tabs: $tabs, isTablet: $isTablet, selectedTab: $selectedTab, selectedChildTab: $selectedChildTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabViewStateImpl &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            (identical(other.isTablet, isTablet) ||
                other.isTablet == isTablet) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.selectedChildTab, selectedChildTab) ||
                other.selectedChildTab == selectedChildTab));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tabs),
    isTablet,
    selectedTab,
    selectedChildTab,
  );

  /// Create a copy of TabViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabViewStateImplCopyWith<_$TabViewStateImpl> get copyWith =>
      __$$TabViewStateImplCopyWithImpl<_$TabViewStateImpl>(this, _$identity);
}

abstract class _TabViewState extends TabViewState {
  const factory _TabViewState({
    required final List<NavItem> tabs,
    required final bool isTablet,
    required final NavItem selectedTab,
    required final NavChildItem selectedChildTab,
  }) = _$TabViewStateImpl;
  const _TabViewState._() : super._();

  @override
  List<NavItem> get tabs;
  @override
  bool get isTablet;
  @override
  NavItem get selectedTab;
  @override
  NavChildItem get selectedChildTab;

  /// Create a copy of TabViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabViewStateImplCopyWith<_$TabViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
