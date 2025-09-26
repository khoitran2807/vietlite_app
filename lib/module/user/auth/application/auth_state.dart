part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AppUser appUser,
    required PremiumConfig premiumConfig,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _AuthState;

  bool get isLoggedIn => appUser != AppUser.empty();

  bool get isLoggedInAnonymous => isLoggedIn && appUser.isAnonymous;

  bool get isLoggedInWithEmail =>
      isLoggedIn && !appUser.isAnonymous && appUser.email.isNotEmpty;

  bool get isWordSelectionPremium => premiumConfig.wordSelection;

  bool get isWordMatchPremium => premiumConfig.wordMatch;

  bool get isThingsPremium => premiumConfig.things;

  factory AuthState.initial() => AuthState(
    appUser: AppUser.empty(),
    premiumConfig: PremiumConfig.empty(),
    failureOrSuccessOption: none(),
    isLoading: false,
  );

  const AuthState._();
}
