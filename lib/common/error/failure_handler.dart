import 'package:firebase_auth/firebase_auth.dart';
import 'package:vietlite/common/error/app_failure.dart';

class FailureHandler {
  static AppFailure handleFailure(Object error) {
    // TODO: add more exception error
    if (error is FirebaseException) {
      return AppFailure.firebaseAuthError(message: error.message ?? '');
    }
    return AppFailure.otherError(message: 'unknown error happened');
  }
}
