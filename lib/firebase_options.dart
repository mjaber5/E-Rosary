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
/// await Firebase.initializeApp(git
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
    apiKey: 'AIzaSyDXKRGfxEY91Y0uWoYLwKQ957Xse1jz5f8',
    appId: '1:1043899488521:web:0e0b04e251dcb80c2cdbd8',
    messagingSenderId: '1043899488521',
    projectId: 'e-rosary',
    authDomain: 'e-rosary.firebaseapp.com',
    storageBucket: 'e-rosary.firebasestorage.app',
    measurementId: 'G-79GBS5E3KW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpHX4M3q77xC7-cElqMCThjKB2JBF0Ue0',
    appId: '1:1043899488521:android:f25d1d94a554ee4c2cdbd8',
    messagingSenderId: '1043899488521',
    projectId: 'e-rosary',
    storageBucket: 'e-rosary.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGoZG_7pDHIdBLFPOUIh43naDB-lF9nwc',
    appId: '1:1043899488521:ios:7ced5f4f4667f6e72cdbd8',
    messagingSenderId: '1043899488521',
    projectId: 'e-rosary',
    storageBucket: 'e-rosary.firebasestorage.app',
    iosBundleId: 'com.example.eOsary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGoZG_7pDHIdBLFPOUIh43naDB-lF9nwc',
    appId: '1:1043899488521:ios:7ced5f4f4667f6e72cdbd8',
    messagingSenderId: '1043899488521',
    projectId: 'e-rosary',
    storageBucket: 'e-rosary.firebasestorage.app',
    iosBundleId: 'com.example.eOsary',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXKRGfxEY91Y0uWoYLwKQ957Xse1jz5f8',
    appId: '1:1043899488521:web:c283980bebed772b2cdbd8',
    messagingSenderId: '1043899488521',
    projectId: 'e-rosary',
    authDomain: 'e-rosary.firebaseapp.com',
    storageBucket: 'e-rosary.firebasestorage.app',
    measurementId: 'G-V622XWQYXR',
  );
}