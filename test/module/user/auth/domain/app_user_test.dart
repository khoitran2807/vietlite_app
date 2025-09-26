import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';

void main() {
  group('AppUser', () {
    const id = 'id';
    const email = 'test@example.com';
    const name = 'John Doe';
    const avatar = 'https://example.com/avatar.jpg';
    const isAnonymous = false;

    const validJson = {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'isAnonymous': isAnonymous,
    };

    const emptyJson = {
      'id': '',
      'email': '',
      'name': '',
      'avatar': '',
      'isAnonymous': false,
    };

    const appUser = AppUser(
      id: id,
      email: email,
      name: name,
      avatar: avatar,
      isAnonymous: isAnonymous,
    );

    test('supports value equality', () {
      const identicalUser = AppUser(
        id: id,
        email: email,
        name: name,
        avatar: avatar,
        isAnonymous: isAnonymous,
      );

      expect(appUser, identicalUser);
      expect(appUser.hashCode, identicalUser.hashCode);
    });

    test('can be serialized to JSON', () {
      expect(appUser.toJson(), validJson);
    });

    test('can be deserialized from JSON', () {
      expect(AppUser.fromJson(validJson), appUser);
    });

    test('supports copyWith for partial updates', () {
      final updatedUser = appUser.copyWith(name: 'Jane Doe');

      expect(updatedUser.name, 'Jane Doe');
      expect(updatedUser.email, email); // Unchanged
      expect(updatedUser.avatar, avatar); // Unchanged
      expect(updatedUser.isAnonymous, isAnonymous); // Unchanged
    });

    test('empty factory creates an empty AppUser', () {
      final emptyUser = AppUser.empty();
      expect(emptyUser.toJson(), emptyJson);
      expect(emptyUser.email, '');
      expect(emptyUser.name, '');
      expect(emptyUser.avatar, '');
      expect(emptyUser.isAnonymous, false);
    });

    test('fromJson handles empty fields correctly', () {
      expect(AppUser.fromJson(emptyJson), AppUser.empty());
    });

    test('displayName returns name when name is not empty', () {
      const userWithName = AppUser(
        id: id,
        email: email,
        name: name,
        avatar: avatar,
        isAnonymous: isAnonymous,
      );

      expect(userWithName.displayName, name);
    });

    test('displayName returns email when name is empty', () {
      const userWithoutName = AppUser(
        id: id,
        email: email,
        name: '',
        avatar: avatar,
        isAnonymous: isAnonymous,
      );

      expect(userWithoutName.displayName, email);
    });
  });
  group('PremiumConfig', () {
    const config = PremiumConfig(
      wordSelection: true,
      wordMatch: false,
      things: true,
    );

    final expectedJson = {
      'wordSelection': true,
      'wordMatch': false,
      'things': true,
    };

    test('can be serialized to JSON', () {
      expect(config.toJson(), expectedJson);
    });

    test('can be deserialized from JSON', () {
      expect(PremiumConfig.fromJson(expectedJson), config);
    });
  });
}
