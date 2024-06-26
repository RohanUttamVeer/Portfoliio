// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDm1jWruW20Dapvf3Tmy28iG3hgVW2n4kE',
    appId: '1:1022187740734:web:29627dbef9877dc259fb6f',
    messagingSenderId: '1022187740734',
    projectId: 'portfolio-6729f',
    authDomain: 'portfolio-6729f.firebaseapp.com',
    storageBucket: 'portfolio-6729f.appspot.com',
    measurementId: 'G-M5XLLKDTVK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYRhsGRKB-aRAfVcvp0OARrhoqXlaQrlU',
    appId: '1:1022187740734:android:fd7547369435f0bb59fb6f',
    messagingSenderId: '1022187740734',
    projectId: 'portfolio-6729f',
    storageBucket: 'portfolio-6729f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADa2EjC5yAxkrp-jw5zBKkjVVVVVPQPx8',
    appId: '1:1022187740734:ios:b002633518a1f6bf59fb6f',
    messagingSenderId: '1022187740734',
    projectId: 'portfolio-6729f',
    storageBucket: 'portfolio-6729f.appspot.com',
    iosClientId: '1022187740734-2q0dh156lbi1fcr1d0odjrv0sk7ck0s8.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADa2EjC5yAxkrp-jw5zBKkjVVVVVPQPx8',
    appId: '1:1022187740734:ios:2e2e8a44ef59b5f359fb6f',
    messagingSenderId: '1022187740734',
    projectId: 'portfolio-6729f',
    storageBucket: 'portfolio-6729f.appspot.com',
    iosClientId: '1022187740734-arqti5uf7p7mvlqk7j5eh3gfdd5fk5ub.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio.RunnerTests',
  );
}
