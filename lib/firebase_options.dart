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
    apiKey: 'AIzaSyDEGovrvndMl3UQFO9EMAO59vugHdcOi0I',
    appId: '1:217297950271:web:2dcf68be8713623de74a8a',
    messagingSenderId: '217297950271',
    projectId: 'calcul-charge-mentale-v2',
    authDomain: 'calcul-charge-mentale-v2.firebaseapp.com',
    storageBucket: 'calcul-charge-mentale-v2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnoD3vkVZC83WRlScOL_2GQBW-RURBF6c',
    appId: '1:217297950271:android:d23d6e02f0f4f3a0e74a8a',
    messagingSenderId: '217297950271',
    projectId: 'calcul-charge-mentale-v2',
    storageBucket: 'calcul-charge-mentale-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEovCNLlpSEp35dV_sUkfQ-vMTym8NluY',
    appId: '1:217297950271:ios:ee9780365ac4f808e74a8a',
    messagingSenderId: '217297950271',
    projectId: 'calcul-charge-mentale-v2',
    storageBucket: 'calcul-charge-mentale-v2.appspot.com',
    iosBundleId: 'com.example.calculchargementalev2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEovCNLlpSEp35dV_sUkfQ-vMTym8NluY',
    appId: '1:217297950271:ios:ee9780365ac4f808e74a8a',
    messagingSenderId: '217297950271',
    projectId: 'calcul-charge-mentale-v2',
    storageBucket: 'calcul-charge-mentale-v2.appspot.com',
    iosBundleId: 'com.example.calculchargementalev2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEGovrvndMl3UQFO9EMAO59vugHdcOi0I',
    appId: '1:217297950271:web:482552a7397e7147e74a8a',
    messagingSenderId: '217297950271',
    projectId: 'calcul-charge-mentale-v2',
    authDomain: 'calcul-charge-mentale-v2.firebaseapp.com',
    storageBucket: 'calcul-charge-mentale-v2.appspot.com',
  );

}