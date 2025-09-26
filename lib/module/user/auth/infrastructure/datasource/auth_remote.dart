import 'package:firebase_auth/firebase_auth.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:vietlite/plugin/firebase/firebase_extension.dart';

@injectable
class AuthRemoteDataSource {
  final AuthService authService;
  final FirestoreService firestoreService;

  const AuthRemoteDataSource({
    required this.authService,
    required this.firestoreService,
  });

  Stream<AppUser> userChanges() {
    return authService.userChanges().map((User? user) {
      if (user != null) {
        return AppUser.fromJson(user.toJson);
      }
      return AppUser.empty();
    });
  }

  Future<void> signOut() async {
    await authService.signOut();
  }

  Future<void> upsertUser({required AppUser appUser}) async {
    await firestoreService.upsertUser(
      userId: appUser.id,
      userData: appUser.toJson(),
    );
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await authService.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  Future<PremiumConfig> getPremiumConfig({required String userId}) async {
    final Map<String, dynamic> data = await firestoreService
        .getDocumentInCollection(collection: 'users', document: userId);
    if (data.isEmpty || !data.containsKey('premium')) {
      return PremiumConfig.empty();
    }
    return PremiumConfig.fromJson(data['premium']);
  }
}
