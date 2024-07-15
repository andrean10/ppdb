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
class DefaultFirebaseOptionsOld {
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
    apiKey: 'AIzaSyAfxkE-sBGLE2jNl0xY2_Lqz-Ubxl_yqfY',
    appId: '1:181278162179:web:e9fbe973e313eecb11bd36',
    messagingSenderId: '181278162179',
    projectId: 'ppdb-pami-7651b',
    authDomain: 'ppdb-pami-7651b.firebaseapp.com',
    storageBucket: 'ppdb-pami-7651b.appspot.com',
    measurementId: 'G-H06DKM3C31',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAHMel2MyDJSf464an9yGPS_v87KIM0gE',
    appId: '1:181278162179:android:cb20b6447968538911bd36',
    messagingSenderId: '181278162179',
    projectId: 'ppdb-pami-7651b',
    storageBucket: 'ppdb-pami-7651b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiwjbxJIG0q2yQHDbmIICEGt9QiYrEps4',
    appId: '1:181278162179:ios:b9790d75fe8ab85d11bd36',
    messagingSenderId: '181278162179',
    projectId: 'ppdb-pami-7651b',
    storageBucket: 'ppdb-pami-7651b.appspot.com',
    iosBundleId: 'com.example.ppdb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiwjbxJIG0q2yQHDbmIICEGt9QiYrEps4',
    appId: '1:181278162179:ios:b9790d75fe8ab85d11bd36',
    messagingSenderId: '181278162179',
    projectId: 'ppdb-pami-7651b',
    storageBucket: 'ppdb-pami-7651b.appspot.com',
    iosBundleId: 'com.example.ppdb',
  );
}
