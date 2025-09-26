class AppFailure {
  final String message;

  AppFailure({required this.message});
  // TODO: handle multi language of error exception

  factory AppFailure.storageError({required String message}) =>
      AppFailure(message: message);

  factory AppFailure.firebaseAuthError({required String message}) =>
      AppFailure(message: message);

  factory AppFailure.otherError({required String message}) =>
      AppFailure(message: message);
}
