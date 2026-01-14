import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

class RemoteConfigConstants {
  static const String numbers = 'numbers';
  static const String letters = 'letters';
  static const String wordSelections = 'wordSelections';
  static const String wordMatches = 'wordMatches';
  static const String things = 'things';
}

@singleton
class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService({required this.remoteConfig});

  Future<void> init() async {
    try {
      await _initDefaults();
      await remoteConfig.fetchAndActivate();
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  Future<void> _initDefaults() async {
    try {
      await remoteConfig.setDefaults({
        RemoteConfigConstants.numbers: 9,
        RemoteConfigConstants.letters: 62,
        RemoteConfigConstants.wordSelections: 10,
        RemoteConfigConstants.wordMatches: 10,
        RemoteConfigConstants.things: 50,
      });
    } catch (e) {
      debugPrint("Error setting default values: $e");
    }
  }

  int get numbers => remoteConfig.getInt(RemoteConfigConstants.numbers);

  int get letters => remoteConfig.getInt(RemoteConfigConstants.letters);

  int get wordSelections =>
      remoteConfig.getInt(RemoteConfigConstants.wordSelections);

  int get wordMatches => remoteConfig.getInt(RemoteConfigConstants.wordMatches);

  int get wordNSentences => wordMatches + wordSelections;

  int get things => remoteConfig.getInt(RemoteConfigConstants.things);
}
