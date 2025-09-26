import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultiBlocProviderFrameWrapper extends StatelessWidget {
  final List<BlocProvider> providers;
  final Widget child;
  const MultiBlocProviderFrameWrapper({
    super.key,
    required this.providers,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: AppFrameWrapper(child: child),
    );
  }
}

class AppFrameWrapper extends StatelessWidget {
  final Widget child;
  const AppFrameWrapper({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: lightTheme,
      home: child,
    );
  }
}
