import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

enum AppFlavor {
  dev,
  prod;

  FirebaseOptions get firebaseOptions {
    switch (this) {
      case AppFlavor.dev:
        return const FirebaseOptions(
          apiKey: "AIzaSyCOeX_JBBZ7gTNLk1kCuKbsoxiG4Uaum8c",
          authDomain: "viet-lite.firebaseapp.com",
          projectId: "viet-lite",
          storageBucket: "viet-lite.firebasestorage.app",
          messagingSenderId: "823395646309",
          appId: "1:823395646309:web:24b57626212ce464f73f8c",
          measurementId: "G-7GR57T2E4P",
        );
      case AppFlavor.prod:
        return const FirebaseOptions(
          apiKey: "AIzaSyCOeX_JBBZ7gTNLk1kCuKbsoxiG4Uaum8c",
          authDomain: "viet-lite.firebaseapp.com",
          projectId: "viet-lite",
          storageBucket: "viet-lite.firebasestorage.app",
          messagingSenderId: "823395646309",
          appId: "1:823395646309:web:24b57626212ce464f73f8c",
          measurementId: "G-7GR57T2E4P",
        );
    }
  }
}

@singleton
class AppConfig {
  AppFlavor _appFlavor = AppFlavor.prod;

  void changeFlavor(AppFlavor flavor) {
    _appFlavor = flavor;
  }

  String get appName {
    switch (_appFlavor) {
      case AppFlavor.dev:
        return 'Việt Lite Dev';
      case AppFlavor.prod:
        return 'Việt Lite';
    }
  }
}
