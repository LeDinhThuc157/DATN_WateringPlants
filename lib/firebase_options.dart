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
    apiKey: 'AIzaSyDueQ3JdgxCdXAAvzUaKTmhY-RYdHEJKW0',
    appId: '1:123133368250:web:fe97a5b778972a849e2f83',
    messagingSenderId: '123133368250',
    projectId: 'esp32test-58f3f',
    authDomain: 'esp32test-58f3f.firebaseapp.com',
    databaseURL: 'https://esp32test-58f3f-default-rtdb.firebaseio.com',
    storageBucket: 'esp32test-58f3f.appspot.com',
    measurementId: 'G-Z4B15T1LJH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmJ8hgUhk9zS-_anMpGI9fA45MR90W0RI',
    appId: '1:123133368250:android:a4f3148656b8a3c89e2f83',
    messagingSenderId: '123133368250',
    projectId: 'esp32test-58f3f',
    databaseURL: 'https://esp32test-58f3f-default-rtdb.firebaseio.com',
    storageBucket: 'esp32test-58f3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxV2o62mJD1_l9_emRAvOk5QOFGPC2hvA',
    appId: '1:123133368250:ios:1f568e8cf79871ae9e2f83',
    messagingSenderId: '123133368250',
    projectId: 'esp32test-58f3f',
    databaseURL: 'https://esp32test-58f3f-default-rtdb.firebaseio.com',
    storageBucket: 'esp32test-58f3f.appspot.com',
    androidClientId: '123133368250-0jpiu2qn117m6o7l3rmtl30mjtbfhsj4.apps.googleusercontent.com',
    iosBundleId: 'com.example.apptuoicay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxV2o62mJD1_l9_emRAvOk5QOFGPC2hvA',
    appId: '1:123133368250:ios:9b6bd77b63d3c0ed9e2f83',
    messagingSenderId: '123133368250',
    projectId: 'esp32test-58f3f',
    databaseURL: 'https://esp32test-58f3f-default-rtdb.firebaseio.com',
    storageBucket: 'esp32test-58f3f.appspot.com',
    androidClientId: '123133368250-0jpiu2qn117m6o7l3rmtl30mjtbfhsj4.apps.googleusercontent.com',
    iosBundleId: 'com.example.apptuoicay.RunnerTests',
  );
}