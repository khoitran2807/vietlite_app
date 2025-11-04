import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vietlite/plugin/google/google_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth auth;
  final GoogleService googleService;

  AuthService({required this.auth, required this.googleService});

  User? get user => auth.currentUser;

  bool get isPasswordUser {
    return user?.providerData.any((info) => info.providerId == 'password') ??
        false;
  }

  Stream<User?> userChanges() {
    return auth.userChanges();
  }

  Future<User?> signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An other error happened',
        stackTrace: StackTrace.current,
      );
    }
    return user;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      // if user is anonymous, link it
      // if not, sign in normally
      if (user != null && user!.isAnonymous) {
        debugPrint('current anonymous user is ${user!.uid}');
        User? linkUser = await linkCredential(credential);
        if (linkUser == null) {
          debugPrint(
            'this case is wrongly link credential, need to signIn directly',
          );
          await auth.signInWithCredential(credential);
        }
      } else {
        debugPrint('this case is signIn directly');
        await auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An other error happened',
        stackTrace: StackTrace.current,
      );
    }
    return user;
  }

  Future<User?> signInWithGoogle() async {
    try {
      await googleService.signIn();
      if (googleService.account != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleService.account!.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // if user is anonymous, link it
        // if not, sign in normally
        if (user != null && user!.isAnonymous) {
          debugPrint('current anonymous user is ${user!.uid}');
          User? linkUser = await linkCredential(credential);
          if (linkUser == null) {
            debugPrint(
              'this case is wrongly link credential, need to signIn directly',
            );
            await auth.signInWithCredential(credential);
          }
        } else {
          debugPrint('this case is signIn directly');
          await auth.signInWithCredential(credential);
        }
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An other error happened',
        stackTrace: StackTrace.current,
      );
    }
    return user;
  }

  Future<User?> linkCredential(AuthCredential credential) async {
    try {
      final userCredential = await user!.linkWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> forgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An unexpected error occurred',
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // update name to user profile
      await userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An unexpected error occurred',
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<void> signOut() async {
    await googleService.signOut();
    await auth.signOut();
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final currentUser = user;
    if (currentUser == null || currentUser.email == null) {
      throw FirebaseAuthException(
        code: "user-not-found",
        message: "User not logged in",
      );
    }
    try {
      final credential = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: currentPassword,
      );
      await currentUser.reauthenticateWithCredential(credential);

      await currentUser.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: e.message,
        code: e.code,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'FirebaseAuth',
        message: 'An unexpected error occurred',
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<void> deleteUser() async {
    if (user != null) {
      try {
        await user!.delete();
      } on FirebaseAuthException catch (e) {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          message: e.message,
          code: e.code,
          stackTrace: StackTrace.current,
        );
      } catch (e) {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          message: 'An other error happened',
          stackTrace: StackTrace.current,
        );
      }
    }
  }
}
