import 'package:flutter/material.dart';

final class WidgetKeys {
  // login screen
  static const Key emailInput = Key('emailInput');
  static const Key passwordInput = Key('passwordInput');
  static const Key signInWithPasswordButton = Key('signInWithPasswordButton');
  static const Key signInWithGoogleButton = Key('signInWithGoogleButton');
  static const Key signInWithPasswordLoading = Key('signInWithPasswordLoading');
  static const Key anonymousSignInLoading = Key('anonymousSignInLoading');
  static const Key skipLoginButton = Key('skipLoginButton');

  //forget password screen
  static const Key forgetPasswordButton = Key('forgetPasswordButton');
  static const Key forgetPasswordLoading = Key('forgetPasswordLoading');

  //register screen
  static const Key registerButton = Key('registerButton');
  static const Key registerLoading = Key('registerLoading');
  static const Key nameInput = Key('nameInput');

  //change password screen
  static const Key currentPasswordInput = Key('currentPasswordInput');
  static const Key newPasswordInput = Key('newPasswordInput');
  static const Key confirmPasswordInput = Key('confirmPasswordInput');
  static const Key changePasswordButton = Key('changePasswordButton');
  static const Key cancelChangePassword = Key('cancelChangePassword');
  static const Key changePasswordLoading = Key('changePasswordLoading');

  //letter_detail
  static const Key audioTitle = Key('audioTitle');
}
