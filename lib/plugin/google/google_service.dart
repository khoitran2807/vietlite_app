import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@singleton
class GoogleService {
  final GoogleSignIn googleSignIn;

  GoogleService({required this.googleSignIn});

  GoogleSignInAccount? get account => googleSignIn.currentUser;

  Future<GoogleSignInAccount?> signIn() => googleSignIn.signIn();

  Future<GoogleSignInAccount?> signInSilently() =>
      googleSignIn.signInSilently();

  Future<GoogleSignInAccount?> signOut() => googleSignIn.signOut();
}
