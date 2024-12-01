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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBt-_XuJxcXOH6X8OL2opTLj21wNXMQSsc',
    appId: '1:438641029309:web:00070d4474d4937ec207d4',
    messagingSenderId: '438641029309',
    projectId: 'facedivi-bga',
    authDomain: 'facedivi-bga.firebaseapp.com',
    storageBucket: 'facedivi-bga.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAww_LRxdWwkKPOSZ2c-vp9-8pa7baRoM',
    appId: '1:438641029309:android:26e1ea4735256cfdc207d4',
    messagingSenderId: '438641029309',
    projectId: 'facedivi-bga',
    storageBucket: 'facedivi-bga.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAk0I6RVwLxnZbC69E6b6XZ2o94AObk3A',
    appId: '1:438641029309:ios:d6d5944e6604fd79c207d4',
    messagingSenderId: '438641029309',
    projectId: 'facedivi-bga',
    storageBucket: 'facedivi-bga.firebasestorage.app',
    iosBundleId: 'com.example.flutterAbsensiApp',
  );
}
