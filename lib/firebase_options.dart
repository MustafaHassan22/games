// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBOI2S6KoOO1wVvOOXYDeTwJwZ87Lc-HmI',
    appId: '1:640823443717:web:3519f1d5d00a7f8fccf76c',
    messagingSenderId: '640823443717',
    projectId: 'game-ad092',
    authDomain: 'game-ad092.firebaseapp.com',
    storageBucket: 'game-ad092.firebasestorage.app',
    measurementId: 'G-CGGHEJ2EBN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuBS3p9A_NfWRqHtqLSqubiitF3OEzfok',
    appId: '1:640823443717:android:10f74155dea5d232ccf76c',
    messagingSenderId: '640823443717',
    projectId: 'game-ad092',
    storageBucket: 'game-ad092.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9q0j1IODPq1nQGCgNbW7GRa36dbF_R_Q',
    appId: '1:640823443717:ios:d03cfc93d609b8bdccf76c',
    messagingSenderId: '640823443717',
    projectId: 'game-ad092',
    storageBucket: 'game-ad092.firebasestorage.app',
    iosBundleId: 'com.example.games',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9q0j1IODPq1nQGCgNbW7GRa36dbF_R_Q',
    appId: '1:640823443717:ios:d03cfc93d609b8bdccf76c',
    messagingSenderId: '640823443717',
    projectId: 'game-ad092',
    storageBucket: 'game-ad092.firebasestorage.app',
    iosBundleId: 'com.example.games',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBOI2S6KoOO1wVvOOXYDeTwJwZ87Lc-HmI',
    appId: '1:640823443717:web:7fe6091a694d7751ccf76c',
    messagingSenderId: '640823443717',
    projectId: 'game-ad092',
    authDomain: 'game-ad092.firebaseapp.com',
    storageBucket: 'game-ad092.firebasestorage.app',
    measurementId: 'G-806CQ642DC',
  );
}
