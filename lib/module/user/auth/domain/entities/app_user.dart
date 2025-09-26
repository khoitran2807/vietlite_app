import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    required String id,
    required String email,
    required String name,
    required String avatar,
    required bool isAnonymous,
  }) = _AppUser;

  factory AppUser.empty() => const AppUser(
    id: '',
    email: '',
    name: '',
    avatar: '',
    isAnonymous: false,
  );

  String get displayName => name.isNotEmpty ? name : email;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
