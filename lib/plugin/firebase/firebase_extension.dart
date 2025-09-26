import 'package:firebase_auth/firebase_auth.dart';

extension UserExt on User {
  Map<String, dynamic> get toJson {
    return {
      'id': uid,
      'name': displayName ?? '',
      'email': email ?? '',
      'avatar': photoURL ?? '',
      'isAnonymous': isAnonymous,
    };
  }
}
