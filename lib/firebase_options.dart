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
    apiKey: 'AIzaSyC2w7I1CCdGDsaUmrBEKJOFeN07YPyDAVk',
    appId: '1:389704467553:web:f9db9e400dc6e65367d620',
    messagingSenderId: '389704467553',
    projectId: 'education-apps-643e0',
    authDomain: 'education-apps-643e0.firebaseapp.com',
    storageBucket: 'education-apps-643e0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDArtXoIR8XHlaVBG9iSAdcO1hNIKWVWM4',
    appId: '1:389704467553:android:f3caaae710c9c06867d620',
    messagingSenderId: '389704467553',
    projectId: 'education-apps-643e0',
    storageBucket: 'education-apps-643e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDW55m8_3XCsQrRXr_4LcAyd5aeFj4w-N0',
    appId: '1:389704467553:ios:7182bdade1592b2967d620',
    messagingSenderId: '389704467553',
    projectId: 'education-apps-643e0',
    storageBucket: 'education-apps-643e0.appspot.com',
    iosBundleId: 'com.example.educationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDW55m8_3XCsQrRXr_4LcAyd5aeFj4w-N0',
    appId: '1:389704467553:ios:7182bdade1592b2967d620',
    messagingSenderId: '389704467553',
    projectId: 'education-apps-643e0',
    storageBucket: 'education-apps-643e0.appspot.com',
    iosBundleId: 'com.example.educationApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2w7I1CCdGDsaUmrBEKJOFeN07YPyDAVk',
    appId: '1:389704467553:web:511e4d51321824c367d620',
    messagingSenderId: '389704467553',
    projectId: 'education-apps-643e0',
    authDomain: 'education-apps-643e0.firebaseapp.com',
    storageBucket: 'education-apps-643e0.appspot.com',
  );
}
