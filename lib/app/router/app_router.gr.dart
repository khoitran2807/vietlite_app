// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:vietlite/module/discover/root/presentation/discover_screen.dart'
    as _i2;
import 'package:vietlite/module/discover/thing_detail/presentation/thing_detail_screen.dart'
    as _i16;
import 'package:vietlite/module/discover/things/presentation/things_screen.dart'
    as _i17;
import 'package:vietlite/module/home/presentation/home_screen.dart' as _i4;
import 'package:vietlite/module/letters_and_numbers/letter_detail/presentation/letter_detail_screen.dart'
    as _i5;
import 'package:vietlite/module/letters_and_numbers/letters/presentation/alphabet_screen.dart'
    as _i1;
import 'package:vietlite/module/letters_and_numbers/letters/presentation/letters_screen.dart'
    as _i7;
import 'package:vietlite/module/letters_and_numbers/number_detail/presentation/number_detail_screen.dart'
    as _i9;
import 'package:vietlite/module/letters_and_numbers/numbers/presentation/numbers_screen.dart'
    as _i10;
import 'package:vietlite/module/letters_and_numbers/root/presentation/letters_and_numbers_screen.dart'
    as _i6;
import 'package:vietlite/module/root/presentation/root_screen.dart' as _i13;
import 'package:vietlite/module/setting/presentation/setting_screen.dart'
    as _i14;
import 'package:vietlite/module/user/forget_password/presentation/forget_password_screen.dart'
    as _i3;
import 'package:vietlite/module/user/login/presentation/login_screen.dart'
    as _i8;
import 'package:vietlite/module/user/login/presentation/privacy_policy_screen.dart'
    as _i11;
import 'package:vietlite/module/user/login/presentation/terms_screen.dart'
    as _i15;
import 'package:vietlite/module/user/register/presentation/register_screen.dart'
    as _i12;
import 'package:vietlite/module/words_and_sentences/root/presentation/words_and_sentences_screen.dart'
    as _i22;
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/presentation/word_match_detail_screen.dart'
    as _i18;
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/presentation/word_match_screen.dart'
    as _i19;
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/presentation/word_selection_detail_screen.dart'
    as _i20;
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/presentation/word_selection_screen.dart'
    as _i21;

/// generated route for
/// [_i1.AlphabetScreen]
class AlphabetScreenRoute extends _i23.PageRouteInfo<void> {
  const AlphabetScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AlphabetScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlphabetScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.AlphabetScreen();
    },
  );
}

/// generated route for
/// [_i2.DiscoverScreen]
class DiscoverScreenRoute extends _i23.PageRouteInfo<void> {
  const DiscoverScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DiscoverScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.DiscoverScreen();
    },
  );
}

/// generated route for
/// [_i3.ForgetPasswordScreen]
class ForgetPasswordScreenRoute extends _i23.PageRouteInfo<void> {
  const ForgetPasswordScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ForgetPasswordScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i23.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LetterDetailScreen]
class LetterDetailScreenRoute
    extends _i23.PageRouteInfo<LetterDetailScreenRouteArgs> {
  LetterDetailScreenRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          LetterDetailScreenRoute.name,
          args: LetterDetailScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'LetterDetailScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LetterDetailScreenRouteArgs>(
          orElse: () =>
              LetterDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i5.LetterDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class LetterDetailScreenRouteArgs {
  const LetterDetailScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'LetterDetailScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.LettersAndNumbersScreen]
class LettersAndNumbersScreenRoute extends _i23.PageRouteInfo<void> {
  const LettersAndNumbersScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LettersAndNumbersScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LettersAndNumbersScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.LettersAndNumbersScreen();
    },
  );
}

/// generated route for
/// [_i7.LettersScreen]
class LettersScreenRoute extends _i23.PageRouteInfo<void> {
  const LettersScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LettersScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LettersScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i7.LettersScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginScreen]
class LoginScreenRoute extends _i23.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginScreen();
    },
  );
}

/// generated route for
/// [_i9.NumberDetailScreen]
class NumberDetailScreenRoute
    extends _i23.PageRouteInfo<NumberDetailScreenRouteArgs> {
  NumberDetailScreenRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          NumberDetailScreenRoute.name,
          args: NumberDetailScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'NumberDetailScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<NumberDetailScreenRouteArgs>(
          orElse: () =>
              NumberDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i9.NumberDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class NumberDetailScreenRouteArgs {
  const NumberDetailScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'NumberDetailScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.NumbersScreen]
class NumbersScreenRoute extends _i23.PageRouteInfo<void> {
  const NumbersScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          NumbersScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NumbersScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.NumbersScreen();
    },
  );
}

/// generated route for
/// [_i11.PrivacyPolicyScreen]
class PrivacyPolicyScreenRoute extends _i23.PageRouteInfo<void> {
  const PrivacyPolicyScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PrivacyPolicyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i12.RegisterScreen]
class RegisterScreenRoute extends _i23.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          RegisterScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i13.RootScreen]
class RootScreenRoute extends _i23.PageRouteInfo<void> {
  const RootScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          RootScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i13.RootScreen();
    },
  );
}

/// generated route for
/// [_i14.SettingScreen]
class SettingScreenRoute extends _i23.PageRouteInfo<void> {
  const SettingScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SettingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingScreen();
    },
  );
}

/// generated route for
/// [_i15.TermsScreen]
class TermsScreenRoute extends _i23.PageRouteInfo<void> {
  const TermsScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TermsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i15.TermsScreen();
    },
  );
}

/// generated route for
/// [_i16.ThingDetailScreen]
class ThingDetailScreenRoute
    extends _i23.PageRouteInfo<ThingDetailScreenRouteArgs> {
  ThingDetailScreenRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          ThingDetailScreenRoute.name,
          args: ThingDetailScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ThingDetailScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ThingDetailScreenRouteArgs>(
          orElse: () =>
              ThingDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i16.ThingDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class ThingDetailScreenRouteArgs {
  const ThingDetailScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'ThingDetailScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i17.ThingsScreen]
class ThingsScreenRoute extends _i23.PageRouteInfo<ThingsScreenRouteArgs> {
  ThingsScreenRoute({
    _i24.Key? key,
    required String type,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          ThingsScreenRoute.name,
          args: ThingsScreenRouteArgs(
            key: key,
            type: type,
          ),
          rawPathParams: {'type': type},
          initialChildren: children,
        );

  static const String name = 'ThingsScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ThingsScreenRouteArgs>(
          orElse: () =>
              ThingsScreenRouteArgs(type: pathParams.getString('type')));
      return _i17.ThingsScreen(
        key: args.key,
        type: args.type,
      );
    },
  );
}

class ThingsScreenRouteArgs {
  const ThingsScreenRouteArgs({
    this.key,
    required this.type,
  });

  final _i24.Key? key;

  final String type;

  @override
  String toString() {
    return 'ThingsScreenRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i18.WordMatchDetailScreen]
class WordMatchDetailScreenRoute
    extends _i23.PageRouteInfo<WordMatchDetailScreenRouteArgs> {
  WordMatchDetailScreenRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          WordMatchDetailScreenRoute.name,
          args: WordMatchDetailScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'WordMatchDetailScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WordMatchDetailScreenRouteArgs>(
          orElse: () =>
              WordMatchDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i18.WordMatchDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class WordMatchDetailScreenRouteArgs {
  const WordMatchDetailScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'WordMatchDetailScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i19.WordMatchScreen]
class WordMatchScreenRoute extends _i23.PageRouteInfo<void> {
  const WordMatchScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          WordMatchScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordMatchScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.WordMatchScreen();
    },
  );
}

/// generated route for
/// [_i20.WordSelectionDetailScreen]
class WordSelectionDetailScreenRoute
    extends _i23.PageRouteInfo<WordSelectionDetailScreenRouteArgs> {
  WordSelectionDetailScreenRoute({
    _i24.Key? key,
    required String id,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          WordSelectionDetailScreenRoute.name,
          args: WordSelectionDetailScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'WordSelectionDetailScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WordSelectionDetailScreenRouteArgs>(
          orElse: () => WordSelectionDetailScreenRouteArgs(
              id: pathParams.getString('id')));
      return _i20.WordSelectionDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class WordSelectionDetailScreenRouteArgs {
  const WordSelectionDetailScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final String id;

  @override
  String toString() {
    return 'WordSelectionDetailScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i21.WordSelectionScreen]
class WordSelectionScreenRoute extends _i23.PageRouteInfo<void> {
  const WordSelectionScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          WordSelectionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordSelectionScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i21.WordSelectionScreen();
    },
  );
}

/// generated route for
/// [_i22.WordsAndSentencesScreen]
class WordsAndSentencesScreenRoute extends _i23.PageRouteInfo<void> {
  const WordsAndSentencesScreenRoute({List<_i23.PageRouteInfo>? children})
      : super(
          WordsAndSentencesScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WordsAndSentencesScreenRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i22.WordsAndSentencesScreen();
    },
  );
}
