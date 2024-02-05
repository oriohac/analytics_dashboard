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
    apiKey: 'AIzaSyAmQP9dpabIJwF3GpKlG-fyLnj77_XTa8A',
    appId: '1:822297725368:web:14bd7e76f57a9c19b9e74d',
    messagingSenderId: '822297725368',
    projectId: 'analytics-dashboard-35714',
    authDomain: 'analytics-dashboard-35714.firebaseapp.com',
    storageBucket: 'analytics-dashboard-35714.appspot.com',
    measurementId: 'G-TPKFNXD9PD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQM6WsAxvzpUYZ71K7xBlPXI1ZlTxX0wU',
    appId: '1:822297725368:android:0efc9401d61360c3b9e74d',
    messagingSenderId: '822297725368',
    projectId: 'analytics-dashboard-35714',
    storageBucket: 'analytics-dashboard-35714.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDULdzvT2GtjrPXjUJIgM-VZr0PXaLkhCE',
    appId: '1:822297725368:ios:1b89ab4b6366e563b9e74d',
    messagingSenderId: '822297725368',
    projectId: 'analytics-dashboard-35714',
    storageBucket: 'analytics-dashboard-35714.appspot.com',
    iosBundleId: 'com.example.analyticsDashboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDULdzvT2GtjrPXjUJIgM-VZr0PXaLkhCE',
    appId: '1:822297725368:ios:c79ae89133d68428b9e74d',
    messagingSenderId: '822297725368',
    projectId: 'analytics-dashboard-35714',
    storageBucket: 'analytics-dashboard-35714.appspot.com',
    iosBundleId: 'com.example.analyticsDashboard.RunnerTests',
  );
}
