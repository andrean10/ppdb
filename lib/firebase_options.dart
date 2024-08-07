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
    apiKey: 'AIzaSyAmzp6rhqmoJflUdqDAJaaF8dhDF2L4wp8',
    appId: '1:937783297516:web:f33e497ba7a713eb4d6cc9',
    messagingSenderId: '937783297516',
    projectId: 'ppdb-pami-e93a1',
    authDomain: 'ppdb-pami-e93a1.firebaseapp.com',
    storageBucket: 'ppdb-pami-e93a1.appspot.com',
    measurementId: 'G-NZMDJHK753',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0y9lOtfK30XciRospbkOOQJ-yjMvsOCg',
    appId: '1:937783297516:android:6c1de0d8addb8d454d6cc9',
    messagingSenderId: '937783297516',
    projectId: 'ppdb-pami-e93a1',
    storageBucket: 'ppdb-pami-e93a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8VTAungI-CRzIfr03c3xH_sMu0FWN8Z8',
    appId: '1:937783297516:ios:b3828368f50260194d6cc9',
    messagingSenderId: '937783297516',
    projectId: 'ppdb-pami-e93a1',
    storageBucket: 'ppdb-pami-e93a1.appspot.com',
    iosBundleId: 'com.example.ppdb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8VTAungI-CRzIfr03c3xH_sMu0FWN8Z8',
    appId: '1:937783297516:ios:b3828368f50260194d6cc9',
    messagingSenderId: '937783297516',
    projectId: 'ppdb-pami-e93a1',
    storageBucket: 'ppdb-pami-e93a1.appspot.com',
    iosBundleId: 'com.example.ppdb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmzp6rhqmoJflUdqDAJaaF8dhDF2L4wp8',
    appId: '1:937783297516:web:16aef200d2526ceb4d6cc9',
    messagingSenderId: '937783297516',
    projectId: 'ppdb-pami-e93a1',
    authDomain: 'ppdb-pami-e93a1.firebaseapp.com',
    storageBucket: 'ppdb-pami-e93a1.appspot.com',
    measurementId: 'G-MLBDY3G6CP',
  );

}